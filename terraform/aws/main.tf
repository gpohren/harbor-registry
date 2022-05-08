provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "harbor" {
  ami           = var.ami
  instance_type = var.harbor

  subnet_id                   = aws_subnet.public_1a.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.registry_sg.id]

  key_name = aws_key_pair.harbor_key.key_name

  tags = {
    Name = "harbor"
  }
}