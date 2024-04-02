variable "iam_require_Vpc_Flow_Logs_name" {
  type    = string
  default = "policies/iam.require_Vpc_Flow_Logs"
}

variable "iam_require_Vpc_Flow_Logs_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "iam_require_Vpc_Flow_Logs_exempt_project_list" {
  type    = list(string)
  default = []
}


module "iam_require_Vpc_Flow_Logs_folder" {
  source             = "../module/binary_policy"
  name               = var.iam_require_Vpc_Flow_Logs_name
  scope              = "folder"
  ids                = var.iam_require_Vpc_Flow_Logs_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "iam_require_Vpc_Flow_Logs_project" {
  source             = "../module/binary_policy"
  name               = var.iam_require_Vpc_Flow_Logs_name
  scope              = "project"
  ids                = var.iam_require_Vpc_Flow_Logs_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
