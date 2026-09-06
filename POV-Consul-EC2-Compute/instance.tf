resource "aws_instance" "dashboard-service-app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name  = aws_key_pair.dashboard-couting-appkey.key_name
  associate_public_ip_address = true
  subnet_id= aws_subnet.dashboard-app-subnet.id
  vpc_security_group_ids = [aws_security_group.dashboard-app-security.id]

  tags = {
    Name = "dashboardservice-app-instance"
  }
}

resource "aws_instance" "counting-service-app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name  = aws_key_pair.dashboard-couting-appkey.key_name
  subnet_id= aws_subnet.counting-app-subnet.id
  vpc_security_group_ids = [aws_security_group.couting-app-security.id]

  tags = {
    Name = "countingservice-app-instance"
  }
}