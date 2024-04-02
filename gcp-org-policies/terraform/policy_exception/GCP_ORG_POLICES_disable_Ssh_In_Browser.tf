variable "disable_Ssh_In_Browser_name" {
  type    = string
  default = "policies/compute.disableSshInBrowser"
}

variable "disable_Ssh_In_Browser_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "disable_Ssh_In_Browser_exempt_project_list" {
  type    = list(string)
  default = []
}


module "disable_Ssh_In_Browser_folder" {
  source             = "../module/binary_policy"
  name               = var.disable_Ssh_In_Browser_name
  scope              = "folder"
  ids                = var.disable_Ssh_In_Browser_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "disable_Ssh_In_Browser_project" {
  source             = "../module/binary_policy"
  name               = var.disable_Ssh_In_Browser_name
  scope              = "project"
  ids                = var.disable_Ssh_In_Browser_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
