variable "iam_disableServiceAccountKeyUpload_name" {
  type    = string
  default = "policies/iam.disableServiceAccountKeyUpload"
}

variable "iam_disableServiceAccountKeyUpload_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "iam_disableServiceAccountKeyUpload_exempt_project_list" {
  type    = list(string)
  default = []
}


module "iam_disableServiceAccountKeyUpload_folder" {
  source             = "../module/binary_policy"
  name               = var.iam_disableServiceAccountKeyUpload_name
  scope              = "folder"
  ids                = var.iam_disableServiceAccountKeyUpload_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "iam_disableServiceAccountKeyUpload_project" {
  source             = "../module/binary_policy"
  name               = var.iam_disableServiceAccountKeyUpload_name
  scope              = "project"
  ids                = var.iam_disableServiceAccountKeyUpload_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
