terraform {
  required_version = ">= 1.6"


  cloud {
        organization = "kpyar-hcp"
        hostname = "app.terraform.io"

        workspaces {
            project = "vpc-peering"
            name    = "be-network"
            
        }
    }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}



