terraform {
  cloud {
    organization = "AdvancedTerraform" # CHANGE TO YOUR ORG NAME
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "advanced-terraform-3099246"
    }
  }
}

