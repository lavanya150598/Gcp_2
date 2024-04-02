# Resource Lifecycle Management Tags

resource "google_tags_tag_key" "resource_tag" {
  parent      = var.scope == "organization" ? "organizations/${var.id}" : (var.scope == "folder" ? "folders/${var.id}" : "projects/${var.id}")
  short_name  = var.resource_lifecycle_tags.name
  description = var.resource_lifecycle_tags.desc
}

resource "google_tags_tag_value" "resource_value" {
  for_each    = var.resource_lifecycle_values
  parent      = "tagKeys/${google_tags_tag_key.resource_tag.name}"
  short_name  = each.value.value
  description = each.value.desc
}