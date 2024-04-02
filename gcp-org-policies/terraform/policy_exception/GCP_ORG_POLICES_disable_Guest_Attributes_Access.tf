variable "disable_Guest_Attributes_Access_name" {
  type    = string
  default = "policies/compute.disableGuestAttributesAccess"
}

variable "disable_Guest_Attributes_Access_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "disable_Guest_Attributes_Access_exempt_project_list" {
  type    = list(string)
  default = []
}


module "disable_Guest_Attributes_Access_folder" {
  source             = "../module/binary_policy"
  name               = var.disable_Guest_Attributes_Access_name
  scope              = "folder"
  ids                = var.disable_Guest_Attributes_Access_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "disable_Guest_Attributes_Access_project" {
  source             = "../module/binary_policy"
  name               = var.disable_Guest_Attributes_Access_name
  scope              = "project"
  ids                = var.disable_Guest_Attributes_Access_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
