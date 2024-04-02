variable "iam_require_Os_Login_name" {
  type    = string
  default = "policies/iam.require_Os_Login"
}

variable "iam_require_Os_Login_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "iam_require_Os_Login_exempt_project_list" {
  type    = list(string)
  default = []
}


module "iam_require_Os_Login_folder" {
  source             = "../module/binary_policy"
  name               = var.iam_require_Os_Login_name
  scope              = "folder"
  ids                = var.iam_require_Os_Login_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "iam_require_Os_Login_project" {
  source             = "../module/binary_policy"
  name               = var.iam_require_Os_Login_name
  scope              = "project"
  ids                = var.iam_require_Os_Login_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
