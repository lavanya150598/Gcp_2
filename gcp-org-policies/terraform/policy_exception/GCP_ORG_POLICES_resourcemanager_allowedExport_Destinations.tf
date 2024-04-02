variable "resourcemanager_allowedExport_Destinations_name" {
  type    = string
  default = "policies/resourcemanager.allowedExportDestinations"
}

variable "resourcemanager_allowedExport_Destinations_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "resourcemanager_allowedExport_Destinations_exempt_project_list" {
  type    = list(string)
  default = []
}


module "resourcemanager_allowedExport_Destinations_folder" {
  source             = "../module/binary_policy"
  name               = var.resourcemanager_allowedExport_Destinations_name
  scope              = "folder"
  ids                = var.resourcemanager_allowedExport_Destinations_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "resourcemanager_allowedExport_Destinations_project" {
  source             = "../module/binary_policy"
  name               = var.resourcemanager_allowedExport_Destinations_name
  scope              = "project"
  ids                = var.resourcemanager_allowedExport_Destinations_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
