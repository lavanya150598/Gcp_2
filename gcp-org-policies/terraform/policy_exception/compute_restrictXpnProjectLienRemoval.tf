variable "compute_restrictXpnProjectLienRemoval_name" {
  type    = string
  default = "policies/compute.restrictXpnProjectLienRemoval"
}

variable "compute_restrictXpnProjectLienRemoval_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "compute_restrictXpnProjectLienRemoval_exempt_project_list" {
  type    = list(string)
  default = []
}


module "compute_restrictXpnProjectLienRemoval_folder" {
  source             = "../module/binary_policy"
  name               = var.compute_restrictXpnProjectLienRemoval_name
  scope              = "folder"
  ids                = var.compute_restrictXpnProjectLienRemoval_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "compute_restrictXpnProjectLienRemoval_project" {
  source             = "../module/binary_policy"
  name               = var.compute_restrictXpnProjectLienRemoval_name
  scope              = "project"
  ids                = var.compute_restrictXpnProjectLienRemoval_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
