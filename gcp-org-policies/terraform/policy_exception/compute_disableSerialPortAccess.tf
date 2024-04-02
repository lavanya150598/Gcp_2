variable "compute_disableSerialPortAccess_name" {
  type    = string
  default = "policies/compute.disableSerialPortAccess"
}

variable "compute_disableSerialPortAccess_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "compute_disableSerialPortAccess_exempt_project_list" {
  type    = list(string)
  default = []
}

module "compute_disableSerialPortAccess_folder" {
  source             = "../module/binary_policy"
  name               = var.compute_disableSerialPortAccess_name
  scope              = "folder"
  ids                = var.compute_disableSerialPortAccess_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "compute_disableSerialPortAccess_project" {
  source             = "../module/binary_policy"
  name               = var.compute_disableSerialPortAccess_name
  scope              = "project"
  ids                = var.compute_disableSerialPortAccess_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
