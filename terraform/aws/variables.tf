variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile"
  default     = "main"
}

variable "ami" {
  description = "Ubuntu, 20.04 LTS"
  default     = "ami-0c4f7023847b90238"
}

variable "harbor" {
  description = "Harbor registry"
  default     = "t2.micro"
}

variable "tags" {
  default = {
    Project    = "harbor"
    enviroment = "dev"
  }
}

variable "aws_key_path" {
  description = "Key path"
  default     = "../../keys/harbor_key.pub"
}