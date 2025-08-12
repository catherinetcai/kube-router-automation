resource "local_file" "ansible_inventory" {
  content = templatefile(
    "${path.module}/resources/inventory.tmpl",
    {
      region = var.region
    }
  )
  filename = "../ansible/inventory/aws.yaml"
}
