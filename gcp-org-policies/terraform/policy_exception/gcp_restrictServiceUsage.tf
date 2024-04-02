variable "gcp_restrictServiceUsage_name" {
  type    = string
  default = "policies/gcp.restrictServiceUsage"
}

variable "gcp_restrictServiceUsage_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "gcp_restrictServiceUsage_exempt_project_list" {
  type    = list(string)
  default = []
}

variable "gcp_restrictServiceUsage_exception_spec" {
  type = map(object({
    resource_scope = string
    resource_list  = list(string)
    allowed_values = list(string)
  }))
}

module "gcp_restrictServiceUsage_exception" {
  for_each           = var.gcp_restrictServiceUsage_exception_spec
  source             = "../module/list_policy"
  name               = var.gcp_restrictServiceUsage_name
  scope              = each.value.resource_scope
  ids                = each.value.resource_list
  allowed_values     = each.value.allowed_values
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "gcp_restrictServiceUsage_folder" {
  source             = "../module/list_policy"
  name               = var.gcp_restrictServiceUsage_name
  scope              = "folder"
  ids                = var.gcp_restrictServiceUsage_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "gcp_restrictServiceUsage_project" {
  source             = "../module/list_policy"
  name               = var.gcp_restrictServiceUsage_name
  scope              = "project"
  ids                = var.gcp_restrictServiceUsage_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

