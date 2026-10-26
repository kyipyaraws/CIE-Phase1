data "terraform_remote_state" "fe_network" {
  backend = "remote"

  config = {
    organization = "kpyar-hcp"
    workspaces = {
      name = "fe-network"
    }
  }
}

data "terraform_remote_state" "fe_security" {
  backend = "remote"

  config = {
    organization = "kpyar-hcp"
    workspaces = {
      name = "fe-security"
    }
  }
}
