variable "iam_restrict_Shared_Vpc_Backend_Services_name" {
  type    = string
  default = "policies/compute.restrictSharedVpcBackendServices"
}

variable "iam_restrict_Shared_Vpc_Backend_Services_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "iam_restrict_Shared_Vpc_Backend_Services_exempt_project_list" {
  type    = list(string)
  default = []
}

variable "iam_restrict_Shared_Vpc_Backend_Services_exception_spec" {
  type = map(object({
    resource_scope = string
    resource_list  = list(string)
    allowed_values = list(string)
  }))
}

variable "iam_restrict_Shared_Vpc_Backend_Services" {
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

module "iam_restrict_Shared_Vpc_Backend_Services_custom_exception" {
  for_each           = var.iam_restrict_Shared_Vpc_Backend_Services_exception_spec
  source             = "../module/list_policy"
  name               = var.iam_restrict_Shared_Vpc_Backend_Services_name
  scope              = each.value.resource_scope
  ids                = each.value.resource_list
  allowed_values     = each.value.allowed_values
  denied_values      = []
  allowed_conditions = var.iam_restrict_Shared_Vpc_Backend_Services_allowed_conditions[]
  denied_conditions  = []
}

module "iam_restrict_Shared_Vpc_Backend_Services_folder" {
  source             = "../module/list_policy"
  name               = var.iam_restrict_Shared_Vpc_Backend_Services_name
  scope              = "folder"
  ids                = var.iam_restrict_Shared_Vpc_Backend_Services_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = var.iam_restrict_Shared_Vpc_Backend_Services_allowed_conditions[]
  denied_conditions  = []
}

module "iam_restrict_Shared_Vpc_Backend_Services_project" {
  source             = "../module/list_policy"
  name               = var.iam_restrict_Shared_Vpc_Backend_Services_name
  scope              = "project"
  ids                = var.iam_restrict_Shared_Vpc_Backend_Services_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = var.iam_restrict_Shared_Vpc_Backend_Services_allowed_conditions[]
  denied_conditions  = []
}

