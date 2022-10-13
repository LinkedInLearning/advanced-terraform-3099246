terraform {
  backend "gcs" {
    bucket  = "remotestate_advancedterraform" #REPLACE with your project-id
    prefix  = "terraform/state"
  }
}
