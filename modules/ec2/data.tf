data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "rhel-golden-image"
  owners      = ["self"]
}

data "vault_generic_secret" "ssh" {
  path = "infra-secrets/ssh"
}