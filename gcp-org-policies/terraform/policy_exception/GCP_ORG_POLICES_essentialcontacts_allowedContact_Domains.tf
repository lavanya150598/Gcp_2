variable "essentialcontacts_allowedContact_Domains_name" {
  type    = string
  default = "policies/essentialcontacts.allowedContactDomains"
}

variable "essentialcontacts_allowedContact_Domains_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "essentialcontacts_allowedContact_Domains_exempt_project_list" {
  type    = list(string)
  default = []
}

variable "essentialcontacts_allowedContact_Domains_exception_spec" {
  type = map(object({
    resource_scope = string
    resource_list  = list(string)
    allowed_values = list(string)
  }))
}

variable "essentialcontacts_allowedContact_Domains_allowed_conditions" {
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

module "essentialcontacts_allowedContact_Domains_custom_exception" {
  for_each           = var.essentialcontacts_allowedContact_Domains_exception_spec
  source             = "../module/list_policy"
  name               = var.essentialcontacts_allowedContact_Domains_name
  scope              = each.value.resource_scope
  ids                = each.value.resource_list
  allowed_values     = each.value.allowed_values
  denied_values      = []
  allowed_conditions = var.essentialcontacts_allowedContact_Domains_allowed_conditions
  denied_conditions  = []
}

module "essentialcontacts_allowedContact_Domains_folder" {
  source             = "../module/list_policy"
  name               = var.essentialcontacts_allowedContact_Domains_name
  scope              = "folder"
  ids                = var.essentialcontacts_allowedContact_Domains_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = var.essentialcontacts_allowedContact_Domains_allowed_conditions
  denied_conditions  = []
}

module "essentialcontacts_allowedContact_Domainss_project" {
  source             = "../module/list_policy"
  name               = var.essentialcontacts_allowedContact_Domains_name
  scope              = "project"
  ids                = var.essentialcontacts_allowedContact_Domains_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = var.essentialcontacts_allowedContact_Domains_allowed_conditions
  denied_conditions  = []
}

