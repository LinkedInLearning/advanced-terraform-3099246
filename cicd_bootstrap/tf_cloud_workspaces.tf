resource "tfe_oauth_client" "oauth" {
    organization = var.tfcloud_organization
    api_url = "https://api.github.com"
    http_url = "https://github.com"
    oauth_token = var.github_oauth_token
    service_provider = "github"
}

resource "tfe_workspace" "dev" {
    name = "app-dev"
    organization = var.tfcloud_organization
    tag_names = ["app", "dev-environment"]
    allow_destroy_plan = true
    auto_apply = true
    queue_all_runs = false
    file_triggers_enabled = false
    vcs_repo {
      identifier = var.vcs-identifier
      branch = var.dev-main-branch
      oauth_token_id = tfe_oauth_client.oauth.oauth_token_id
    }
}

resource "tfe_workspace" "qa" {
    name = "app-qa"
    organization = var.tfcloud_organization
    tag_names = ["app", "qa-environment"]
    allow_destroy_plan = true
    auto_apply = true
    queue_all_runs = false
    file_triggers_enabled = false
    vcs_repo {
      identifier = var.vcs-identifier
      branch = var.qa-main-branch
      oauth_token_id = tfe_oauth_client.oauth.oauth_token_id
    }
}