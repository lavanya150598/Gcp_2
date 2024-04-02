variable "run_allowedIngress_name" {
  type    = string
  default = "policies/run.allowedIngress"
}

variable "run_allowedIngress_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "run_allowedIngress_exempt_project_list" {
  type    = list(string)
  default = []
}

module "run_allowedIngress_folder" {
  source             = "../module/list_policy"
  name               = var.run_allowedIngress_name
  scope              = "folder"
  ids                = var.run_allowedIngress_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "run_allowedIngress_project" {
  source             = "../module/list_policy"
  name               = var.run_allowedIngress_name
  scope              = "project"
  ids                = var.run_allowedIngress_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

