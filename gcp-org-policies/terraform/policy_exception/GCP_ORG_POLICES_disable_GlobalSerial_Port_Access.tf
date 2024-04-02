variable "disable_GlobalSerial_Port_Access_name" {
  type    = string
  default = "policies/compute.disableGlobalSerialPortAccess"
}

variable "disable_GlobalSerial_Port_Access_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "disable_GlobalSerial_Port_Access_exempt_project_list" {
  type    = list(string)
  default = []
}


module "disable_GlobalSerial_Port_Access_folder" {
  source             = "../module/binary_policy"
  name               = var.disable_GlobalSerial_Port_Access_name
  scope              = "folder"
  ids                = var.disable_GlobalSerial_Port_Access_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "disable_GlobalSerial_Port_Access_project" {
  source             = "../module/binary_policy"
  name               = var.disable_GlobalSerial_Port_Access_name
  scope              = "project"
  ids                = var.disable_GlobalSerial_Port_Access_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
