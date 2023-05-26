terraform {

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.25.0, < 6.0.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "github" {
  token = var.token
  owner = var.owner
}
