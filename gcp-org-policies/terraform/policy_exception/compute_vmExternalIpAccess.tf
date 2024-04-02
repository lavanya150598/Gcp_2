variable "compute_vmExternalIpAccess_name" {
  type    = string
  default = "policies/compute.vmExternalIpAccess"
}

variable "compute_vmExternalIpAccess_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "compute_vmExternalIpAccess_exempt_project_list" {
  type    = list(string)
  default = []
}

module "compute_vmExternalIpAccess_folder" {
  source             = "../module/list_policy"
  name               = var.compute_vmExternalIpAccess_name
  scope              = "folder"
  ids                = var.compute_vmExternalIpAccess_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "compute_vmExternalIpAccess_project" {
  source             = "../module/list_policy"
  name               = var.compute_vmExternalIpAccess_name
  scope              = "project"
  ids                = var.compute_vmExternalIpAccess_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

