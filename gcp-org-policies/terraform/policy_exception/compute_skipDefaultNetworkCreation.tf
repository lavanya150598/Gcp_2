variable "compute_skipDefaultNetworkCreation_name" {
  type    = string
  default = "policies/compute.skipDefaultNetworkCreation"
}

variable "compute_skipDefaultNetworkCreation_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "compute_skipDefaultNetworkCreation_exempt_project_list" {
  type    = list(string)
  default = []
}

module "compute_skipDefaultNetworkCreation_folder" {
  source             = "../module/binary_policy"
  name               = var.compute_skipDefaultNetworkCreation_name
  scope              = "folder"
  ids                = var.compute_skipDefaultNetworkCreation_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "compute_skipDefaultNetworkCreation_project" {
  source             = "../module/binary_policy"
  name               = var.compute_skipDefaultNetworkCreation_name
  scope              = "project"
  ids                = var.compute_skipDefaultNetworkCreation_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
