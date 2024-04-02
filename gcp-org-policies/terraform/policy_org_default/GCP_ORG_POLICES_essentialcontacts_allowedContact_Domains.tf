variable "essentialcontacts_allowedContact_Domains_name" {
  type    = string
  default = "policies/essentialcontacts.allowedContactDomains"
}

variable "essentialcontacts_allowedContact_Domains_scope" {
  type    = string
  default = "organization"
}

variable "essentialcontacts_allowedContact_Domains_ids" {
  type    = list(string)
  default = []
}

variable "essentialcontacts_allowedContact_Domains_allowed_values" {
  type    = list(string)
  default = []
}

variable "essentialcontacts_allowedContact_Domains_denied_values" {
  type    = list(string)
  default = []
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

variable "essentialcontacts_allowedContact_Domains_denied_conditions" {
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

module "essentialcontacts_allowedContact_Domains" {
  source             = "../module/list_policy"
  name               = var.essentialcontacts_allowedContact_Domains_name
  scope              = var.essentialcontacts_allowedContact_Domains_scope
  ids                = var.essentialcontacts_allowedContact_Domains_scope == "organization" ? [var.organization_id] : var.essentialcontacts_allowedContact_Domains_ids
  allowed_values     = var.essentialcontacts_allowedContact_Domains_allowed_values
  denied_values      = var.essentialcontacts_allowedContact_Domains_denied_values
  allowed_conditions = var.essentialcontacts_allowedContact_Domains_allowed_conditions
  denied_conditions  = var.essentialcontacts_allowedContact_Domains_denied_conditions
}

