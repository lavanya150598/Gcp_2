variable "iam_restrict_Cloud_NAT_Usage_name" {
  type    = string
  default = "policies/iam.restrict_Cloud_NAT_Usage"
}

variable "iam_restrict_Cloud_NAT_Usage_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "iam_restrict_Cloud_NAT_Usage_exempt_project_list" {
  type    = list(string)
  default = []
}


module "iam_restrict_Cloud_NAT_Usage_folder" {
  source             = "../module/binary_policy"
  name               = var.iam_restrict_Cloud_NAT_Usage_name
  scope              = "folder"
  ids                = var.iam_restrict_Cloud_NAT_Usage_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "iam_restrict_Cloud_NAT_Usage_project" {
  source             = "../module/binary_policy"
  name               = var.iam_restrict_Cloud_NAT_Usage_name
  scope              = "project"
  ids                = var.iam_restrict_Cloud_NAT_Usage_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
