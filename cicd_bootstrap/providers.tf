# https://developer.hashicorp.com/terraform/language/providers/requirements
terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.38.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.5"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 2.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 2.2"
    }
  }
}

provider "tfe" {
  # Configuration options
  token = var.tf_cloud_token
}