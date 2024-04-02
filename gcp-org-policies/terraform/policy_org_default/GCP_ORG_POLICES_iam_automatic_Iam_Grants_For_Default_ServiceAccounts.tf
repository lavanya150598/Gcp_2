variable "iam_automatic_Iam_Grants_For_Default_ServiceAccounts_name" {
  type    = string
  default = "policies/iam.automaticIamGrantsForDefaultServiceAccounts"
}

variable "iam_automatic_Iam_Grants_For_Default_ServiceAccounts_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "iam_automatic_Iam_Grants_For_Default_ServiceAccounts_exempt_project_list" {
  type    = list(string)
  default = []
}


module "iam_automatic_Iam_Grants_For_Default_ServiceAccounts_folder" {
  source             = "../module/binary_policy"
  name               = var.iam_automatic_Iam_Grants_For_Default_ServiceAccounts_name
  scope              = "folder"
  ids                = var.iam_automatic_Iam_Grants_For_Default_ServiceAccounts_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "iam_automatic_Iam_Grants_For_Default_ServiceAccounts" {
  source             = "../module/binary_policy"
  name               = var.iam_automatic_Iam_Grants_For_Default_ServiceAccounts_name
  scope              = "project"
  ids                = var.iam_automatic_Iam_Grants_For_Default_ServiceAccounts_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
