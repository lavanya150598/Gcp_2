variable "resourcemanager_allowedExport_Destinations_name" {
  type    = string
  default = "policies/resourcemanager.allowedExportDestinations"
}

variable "resourcemanager_allowedExport_Destinations_scope" {
  type    = string
  default = "organization"
}

variable "resourcemanager_allowedExport_Destinations_ids" {
  type    = list(string)
  default = []
}

variable "resourcemanager_allowedExport_Destinations_allowed_values" {
  type    = list(string)
  default = []
}

variable "resourcemanager_allowedExport_Destinations_denied_values" {
  type    = list(string)
  default = []
}

variable "resourcemanager_allowedExport_Destinations_allowed_conditions" {
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

variable "resourcemanager_allowedExport_Destinations_denied_conditions" {
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

module "resourcemanager_allowedExport_Destinations" {
  source             = "../module/list_policy"
  name               = var.resourcemanager_allowedExport_Destinations_name
  scope              = var.resourcemanager_allowedExport_Destinations_scope
  ids                = var.resourcemanager_allowedExport_Destinations_scope == "organization" ? [var.organization_id] : var.resourcemanager_allowedExport_Destinations_ids
  allowed_values     = var.resourcemanager_allowedExport_Destinations_allowed_values
  denied_values      = var.resourcemanager_allowedExport_Destinations_denied_values
  allowed_conditions = var.resourcemanager_allowedExport_Destinations_allowed_conditions
  denied_conditions  = var.resourcemanager_allowedExport_Destinations_denied_conditions
}

