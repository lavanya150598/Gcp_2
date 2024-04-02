variable "iam_allowedPolicyMemberDomains_name" {
  type    = string
  default = "policies/iam.allowedPolicyMemberDomains"
}

variable "iam_allowedPolicyMemberDomains_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "iam_allowedPolicyMemberDomains_exempt_project_list" {
  type    = list(string)
  default = []
}

variable "iam_allowedPolicyMemberDomains_exception_spec" {
  type = map(object({
    resource_scope = string
    resource_list  = list(string)
    allowed_values = list(string)
  }))
}

variable "iam_allowedPolicyMemberDomains_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
    values = object({
      allowed_values = list(string)
      denied_values  = list(string)
    })
  }))
  default = []
}

module "iam_allowedPolicyMemberDomains_custom_exception" {
  for_each           = var.iam_allowedPolicyMemberDomains_exception_spec
  source             = "../module/list_policy"
  name               = var.iam_allowedPolicyMemberDomains_name
  scope              = each.value.resource_scope
  ids                = each.value.resource_list
  allowed_values     = each.value.allowed_values
  denied_values      = []
  allowed_conditions = var.iam_allowedPolicyMemberDomains_allowed_conditions
  denied_conditions  = []
}

module "iam_allowedPolicyMemberDomains_folder" {
  source             = "../module/list_policy"
  name               = var.iam_allowedPolicyMemberDomains_name
  scope              = "folder"
  ids                = var.iam_allowedPolicyMemberDomains_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = var.iam_allowedPolicyMemberDomains_allowed_conditions
  denied_conditions  = []
}

module "iam_allowedPolicyMemberDomains_project" {
  source             = "../module/list_policy"
  name               = var.iam_allowedPolicyMemberDomains_name
  scope              = "project"
  ids                = var.iam_allowedPolicyMemberDomains_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = var.iam_allowedPolicyMemberDomains_allowed_conditions
  denied_conditions  = []
}

