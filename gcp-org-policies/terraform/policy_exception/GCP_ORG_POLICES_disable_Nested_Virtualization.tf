variable "disable_Nested_Virtualization_name" {
  type    = string
  default = "policies/compute.disableNestedVirtualization"
}

variable "disable_Nested_Virtualization_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "disable_Nested_Virtualization_exempt_project_list" {
  type    = list(string)
  default = []
}


module "disable_Nested_Virtualization_folder" {
  source             = "../module/binary_policy"
  name               = var.disable_Nested_Virtualization_name
  scope              = "folder"
  ids                = var.disable_Nested_Virtualization_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "disable_Nested_Virtualization_project" {
  source             = "../module/binary_policy"
  name               = var.disable_Nested_Virtualization_name
  scope              = "project"
  ids                = var.disable_Nested_Virtualization_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
