
terraform {

  required_providers {
    github = {
      source  = "integrations/github"
    }

    aws = {
      source = "hashicorp/aws"
      version = "~> 5.11.0"
    }
  }
  required_version = "<= 1.5.5"
}


provider "github" {
  token = var.defaults.token
  owner = var.defaults.owner
}