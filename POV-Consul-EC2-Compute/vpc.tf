resource "aws_vpc" "consuleVPC" {
  cidr_block           = var.address_space
  enable_dns_hostnames = true

  tags = {
    name        = "consule-app-VPC"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "dashboard-app-subnet" {
  vpc_id     = aws_vpc.consuleVPC.id
  cidr_block = var.subnet_prefix
  availability_zone = var.dashboard_az

  tags = {
    name    = "dashboard-app-subnet"
  }
}

resource "aws_subnet" "counting-app-subnet" {
  vpc_id     = aws_vpc.consuleVPC.id
  cidr_block = var.counting_subnet_prefix
  availability_zone = var.counting_az

  tags = {
    name    = "counting-app-subnet"
  }
}


resource "aws_security_group" "dashboard-app-security" {
  name        = "dashboard-app-security-group"
  
  vpc_id    = aws_vpc.consuleVPC.id

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
      from_port   = 8888
      to_port     = 8888
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        prefix_list_ids = []
    }

    tags = {
        name    = "dashboard-app-security-group"
    }

}


resource "aws_security_group" "couting-app-security" {
  name        = "couting-app-private-security-group"
  
  vpc_id    = aws_vpc.consuleVPC.id

    ingress {
      from_port       = 9001
      to_port         = 9001
      protocol        = "tcp"
      security_groups = [aws_security_group.dashboard-app-security.id]  # only allow traffic from dashboard-service's SG
    }

    ingress {
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      security_groups = [aws_security_group.dashboard-app-security.id]  # allow SSH-hop from dashboard instance
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        name    = "couting-app-security-group"
    }

}


resource "aws_internet_gateway" "dashboard-application-public-gw" {
  vpc_id = aws_vpc.consuleVPC.id

    tags = {
        Name = "dashboard-application-public-gw"
    }

}

resource "aws_route_table" "dashboard-application-public" {
  vpc_id = aws_vpc.consuleVPC.id


  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id         = aws_internet_gateway.dashboard-application-public-gw.id
  }
}

resource "aws_route_table_association" "dashboard-application-public" {
  subnet_id      = aws_subnet.dashboard-app-subnet.id
  route_table_id = aws_route_table.dashboard-application-public.id
}

resource "aws_eip" "dashboard-application-public" {
  instance = aws_instance.dashboard-service-app.id
  domain    = "vpc"
}

resource "aws_eip_association" "dashboard-application-public" {
  instance_id= aws_instance.dashboard-service-app.id
  allocation_id = aws_eip.dashboard-application-public.id
}







