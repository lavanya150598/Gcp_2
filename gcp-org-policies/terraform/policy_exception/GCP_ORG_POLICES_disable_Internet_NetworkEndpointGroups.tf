variable "disable_Internet_NetworkEndpointGroups_name" {
  type    = string
  default = "policies/compute.disableInternetNetworkEndpointGroup"
}

variable "disable_Internet_NetworkEndpointGroups_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "disable_Internet_NetworkEndpointGroups_exempt_project_list" {
  type    = list(string)
  default = []
}


module "disable_Internet_NetworkEndpointGroups_folder" {
  source             = "../module/binary_policy"
  name               = var.disable_Internet_NetworkEndpointGroups_name
  scope              = "folder"
  ids                = var.disable_Internet_NetworkEndpointGroups_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "disable_Internet_NetworkEndpointGroups_project" {
  source             = "../module/binary_policy"
  name               = var.disable_Internet_NetworkEndpointGroups_name
  scope              = "project"
  ids                = var.disable_Internet_NetworkEndpointGroups_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
