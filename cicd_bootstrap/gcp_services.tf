resource "google_project_service" "dev_services" {
    for_each = toset(var.enable-services)
    project = var.dev-project-id
    service = each.key
    disable_on_destroy = false
}

resource "google_project_service" "qa_services" {
    for_each = toset(var.enable-services)
    project = var.qa-project-id
    service = each.key
    disable_on_destroy = false
}