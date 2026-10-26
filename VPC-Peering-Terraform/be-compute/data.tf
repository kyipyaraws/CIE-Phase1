data "terraform_remote_state" "be_network" {
  backend = "remote"

  config = {
    organization = "kpyar-hcp"
    workspaces = {
      name = "be-network"
    }
  }
}

data "terraform_remote_state" "be_security" {
  backend = "remote"

  config = {
    organization = "kpyar-hcp"
    workspaces = {
      name = "be-security"
    }
  }
}
