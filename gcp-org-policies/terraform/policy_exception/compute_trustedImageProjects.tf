variable "compute_trustedImageProjects_name" {
  type    = string
  default = "policies/compute.trustedImageProjects"
}

variable "compute_trustedImageProjects_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "compute_trustedImageProjects_exempt_project_list" {
  type    = list(string)
  default = []
}

module "compute_trustedImageProjects_folder" {
  source             = "../module/list_policy"
  name               = var.compute_trustedImageProjects_name
  scope              = "folder"
  ids                = var.compute_trustedImageProjects_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "compute_trustedImageProjects_project" {
  source             = "../module/list_policy"
  name               = var.compute_trustedImageProjects_name
  scope              = "project"
  ids                = var.compute_trustedImageProjects_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

