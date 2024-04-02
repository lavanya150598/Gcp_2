variable "restrict_partner_interconnect_usage_name" {
  type    = string
  default = "policies/compute.restrictPartnerInterconnectUsage"
}

variable "restrict_partner_interconnect_usage_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "restrict_partner_interconnect_usage_exempt_project_list" {
  type    = list(string)
  default = []
}

module "restrict_partner_interconnect_usage_folder" {
  source             = "../module/list_policy"
  name               = var.restrict_partner_interconnect_usage_name
  scope              = "folder"
  ids                = var.restrict_partner_interconnect_usage_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "_project" {
  source             = "../module/list_policy"
  name               = var.restrict_partner_interconnect_usage_name
  scope              = "project"
  ids                = var.restrict_partner_interconnect_usage_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

