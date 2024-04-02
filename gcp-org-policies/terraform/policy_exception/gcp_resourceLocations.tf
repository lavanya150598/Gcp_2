variable "gcp_resourceLocations_name" {
  type    = string
  default = "policies/gcp.resourceLocations"
}

variable "gcp_resourceLocations_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "gcp_resourceLocations_exempt_project_list" {
  type    = list(string)
  default = []
}

variable "gcp_resourceLocations_exception_spec" {
  type = map(object({
    resource_scope = string
    resource_list  = list(string)
    allowed_values = list(string)
  }))
}

module "gcp_resourceLocations_exception" {
  for_each           = var.gcp_resourceLocations_exception_spec
  source             = "../module/list_policy"
  name               = var.gcp_resourceLocations_name
  scope              = each.value.resource_scope
  ids                = each.value.resource_list
  allowed_values     = each.value.allowed_values
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "gcp_resourceLocations_folder" {
  source             = "../module/list_policy"
  name               = var.gcp_resourceLocations_name
  scope              = "folder"
  ids                = var.gcp_resourceLocations_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "gcp_resourceLocations_project" {
  source             = "../module/list_policy"
  name               = var.gcp_resourceLocations_name
  scope              = "project"
  ids                = var.gcp_resourceLocations_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

