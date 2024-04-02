variable "sql_restrictAuthorizedNetworks_name" {
  type    = string
  default = "policies/sql.restrictAuthorizedNetworks"
}

variable "sql_restrictAuthorizedNetworks_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "sql_restrictAuthorizedNetworks_exempt_project_list" {
  type    = list(string)
  default = []
}


module "sql_restrictAuthorizedNetworks_folder" {
  source             = "../module/binary_policy"
  name               = var.sql_restrictAuthorizedNetworks_name
  scope              = "folder"
  ids                = var.sql_restrictAuthorizedNetworks_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "sql_restrictAuthorizedNetworks_project" {
  source             = "../module/binary_policy"
  name               = var.sql_restrictAuthorizedNetworks_name
  scope              = "project"
  ids                = var.sql_restrictAuthorizedNetworks_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
