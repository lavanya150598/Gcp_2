variable "iam_restrict_partner_dedicated_interconnect_usage_name" {
  type    = string
  default = "policies/iam.restrict_partner_dedicated_interconnect_usage"
}

variable "iam_restrict_partner_dedicated_interconnect_usage_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "iam_restrict_partner_dedicated_interconnect_usage_exempt_project_list" {
  type    = list(string)
  default = []
}


module "iam_restrict_partner_dedicated_interconnect_usagefolder" {
  source             = "../module/binary_policy"
  name               = var.iam_restrict_partner_dedicated_interconnect_usage_name
  scope              = "folder"
  ids                = var.iam_restrict_partner_dedicated_interconnect_usage_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "iam_restrict_partner_dedicated_interconnect_usage_project" {
  source             = "../module/binary_policy"
  name               = var.iam_restrict_partner_dedicated_interconnect_usage_name
  scope              = "project"
  ids                = var.iam_restrict_partner_dedicated_interconnect_usage_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
