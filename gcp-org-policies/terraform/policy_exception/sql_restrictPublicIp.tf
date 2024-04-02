variable "sql_restrictPublicIp_name" {
  type    = string
  default = "policies/sql.restrictPublicIp"
}

variable "sql_restrictPublicIp_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "sql_restrictPublicIp_exempt_project_list" {
  type    = list(string)
  default = []
}


module "sql_restrictPublicIp_folder" {
  source             = "../module/binary_policy"
  name               = var.sql_restrictPublicIp_name
  scope              = "folder"
  ids                = var.sql_restrictPublicIp_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "sql_restrictPublicIp_project" {
  source             = "../module/binary_policy"
  name               = var.sql_restrictPublicIp_name
  scope              = "project"
  ids                = var.sql_restrictPublicIp_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
