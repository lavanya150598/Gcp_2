variable "cloudfunctions_allowedIngressSettings_name" {
  type    = string
  default = "policies/cloudfunctions.allowedIngressSettings"
}

variable "cloudfunctions_allowedIngressSettings_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "cloudfunctions_allowedIngressSettings_exempt_project_list" {
  type    = list(string)
  default = []
}

module "cloudfunctions_allowedIngressSettings_folder" {
  source             = "../module/list_policy"
  name               = var.cloudfunctions_allowedIngressSettings_name
  scope              = "folder"
  ids                = var.cloudfunctions_allowedIngressSettings_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "cloudfunctions_allowedIngressSettings_project" {
  source             = "../module/list_policy"
  name               = var.cloudfunctions_allowedIngressSettings_name
  scope              = "project"
  ids                = var.cloudfunctions_allowedIngressSettings_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

