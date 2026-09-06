resource "tls_private_key" "dashboard-couting-appkey" {
    algorithm = "ED25519"
}

locals {
    private_key_filename = "ec2-app-ssh-key.pem"
}

resource "aws_key_pair" "dashboard-couting-appkey" {
  key_name   = local.private_key_filename
  public_key = tls_private_key.dashboard-couting-appkey.public_key_openssh
}
