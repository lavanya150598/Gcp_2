variable "iam_storage_Resource_Use_Restriction_firebase_project_list" {
  type    = list(string)
  default = []
}

variable "firebase_project_tag_value" {
  default = "tagValues/507882699460"
}

resource "google_tags_tag_binding" "iam_firebase_project" {
  for_each  = toset(var.iam_storage_Resource_Use_Restriction_firebase_project_list)
  parent    = "//cloudresourcemanager.googleapis.com/projects/${each.value}"
  tag_value = var.firebase_project_tag_value
}