resource "local_file" "ansible_inventory" {
  content = templatefile(
    "${path.module}/resources/inventory.tmpl",
    {
      region                  = var.region
      ansible_ssm_bucket_name = aws_s3_bucket.ansible_ssm_bucket.bucket
    }
  )
  filename = "../ansible/inventory/aws_ec2.yaml"
}
