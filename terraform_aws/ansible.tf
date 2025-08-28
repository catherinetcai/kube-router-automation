resource "local_file" "ansible_inventory" {
  content = templatefile(
    "${path.module}/resources/inventory.tmpl",
    {
      region                  = var.region
      ansible_ssm_bucket_name = var.enable_ssm ? aws_s3_bucket.ansible_ssm_bucket[0].bucket : ""
      enable_ssm              = var.enable_ssm
    }
  )
  filename = "../ansible/inventory/aws_ec2.yaml"
}
