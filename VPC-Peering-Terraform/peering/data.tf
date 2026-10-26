data "terraform_remote_state" "be_network" {
  backend = "remote"

  config = {
    organization = "kpyar-hcp"
    workspaces = {
      name = "be-network"
    }
  }
}

data "terraform_remote_state" "fe_network" {
  backend = "remote"

  config = {
    organization = "kpyar-hcp"
    workspaces = {
      name = "fe-network"
    }
  }
}

locals {
  frontend_vpc_id   = data.terraform_remote_state.fe_network.outputs.frontend_vpc_id
  frontend_vpc_cidr = data.terraform_remote_state.fe_network.outputs.frontend_vpc_cidr

  backend_vpc_id   = data.terraform_remote_state.be_network.outputs.backend_vpc_id
  backend_vpc_cidr = data.terraform_remote_state.be_network.outputs.backend_vpc_cidr
}