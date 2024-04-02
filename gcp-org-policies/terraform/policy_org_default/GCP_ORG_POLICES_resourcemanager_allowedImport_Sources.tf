variable "resourcemanager_allowedImport_Sources_name" {
  type    = string
  default = "policies/resourcemanager.allowedImportSources"
}

variable "resourcemanager_allowedImport_Sources_scope" {
  type    = string
  default = "organization"
}

variable "resourcemanager_allowedImport_Sources_ids" {
  type    = list(string)
  default = []
}

variable "resourcemanager_allowedImport_Sources_allowed_values" {
  type    = list(string)
  default = []
}

variable "resourcemanager_allowedImport_Sources_denied_values" {
  type    = list(string)
  default = []
}

variable "resourcemanager_allowedImport_Sources_allowed_conditions" {
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

variable "resourcemanager_allowedImport_Sources_denied_conditions" {
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

module "resourcemanager_allowedImport_Sources" {
  source             = "../module/list_policy"
  name               = var.resourcemanager_allowedImport_Sources_name
  scope              = var.resourcemanager_allowedImport_Sources_scope
  ids                = var.resourcemanager_allowedImport_Sources_scope == "organization" ? [var.organization_id] : var.resourcemanager_allowedImport_Sources_ids
  allowed_values     = var.resourcemanager_allowedImport_Sources_allowed_values
  denied_values      = var.resourcemanager_allowedImport_Sources_denied_values
  allowed_conditions = var.resourcemanager_allowedImport_Sources_allowed_conditions
  denied_conditions  = var.resourcemanager_allowedImport_Sources_denied_conditions
}

