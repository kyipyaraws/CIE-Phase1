terraform {
  required_version = ">= 1.12"

  cloud {
    organization = "kpyar-hcp"
    hostname     = "app.terraform.io"

    workspaces {
      project = "vpc-peering"
      name    = "fe-network"

    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
    }
  }
}


