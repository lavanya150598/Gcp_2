variable "compute_workloadIdentityPoolProviders_name" {
  type    = string
  default = "policies/iam.workloadIdentityPoolProviders"
}

variable "compute_workloadIdentityPoolProviders_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "compute_workloadIdentityPoolProviders_exempt_project_list" {
  type    = list(string)
  default = []
}

module "compute_workloadIdentityPoolProviders_folder" {
  source             = "../module/list_policy"
  name               = var.compute_workloadIdentityPoolProviders_name
  scope              = "folder"
  ids                = var.compute_workloadIdentityPoolProviders_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "compute_workloadIdentityPoolProviders_project" {
  source             = "../module/list_policy"
  name               = var.compute_workloadIdentityPoolProviders_name
  scope              = "project"
  ids                = var.compute_workloadIdentityPoolProviders_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

