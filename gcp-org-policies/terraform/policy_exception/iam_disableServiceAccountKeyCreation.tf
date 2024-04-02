variable "iam_disableServiceAccountKeyCreation_name" {
  type    = string
  default = "policies/iam.disableServiceAccountKeyCreation"
}

variable "iam_disableServiceAccountKeyCreation_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "iam_disableServiceAccountKeyCreation_exempt_project_list" {
  type    = list(string)
  default = []
}


module "iam_disableServiceAccountKeyCreation_folder" {
  source             = "../module/binary_policy"
  name               = var.iam_disableServiceAccountKeyCreation_name
  scope              = "folder"
  ids                = var.iam_disableServiceAccountKeyCreation_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "iam_disableServiceAccountKeyCreation_project" {
  source             = "../module/binary_policy"
  name               = var.iam_disableServiceAccountKeyCreation_name
  scope              = "project"
  ids                = var.iam_disableServiceAccountKeyCreation_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
