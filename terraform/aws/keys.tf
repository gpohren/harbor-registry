resource "aws_key_pair" "harbor_key" {
  key_name   = "harbor_key"
  public_key = file(var.aws_key_path)
  tags       = var.tags
}