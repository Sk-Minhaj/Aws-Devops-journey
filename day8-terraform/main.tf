resource "local_file" "hello" {
  content  = "Hello from Terraform"
  filename = "${path.module}/hello.txt"
}

output "file_name" {
  value = local_file.hello.filename
}