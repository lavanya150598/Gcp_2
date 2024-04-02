variable "gcp_resourceLocations_name" {
  type    = string
  default = "policies/gcp.resourceLocations"
}

variable "gcp_resourceLocations_scope" {
  type    = string
  default = "organization"
}

variable "gcp_resourceLocations_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "gcp_resourceLocations_allowed_values" {
  type    = list(string)
  default = []
}

variable "gcp_resourceLocations_denied_values" {
  type    = list(string)
  default = []
}

variable "gcp_resourceLocations_allowed_conditions" {
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

variable "gcp_resourceLocations_denied_conditions" {
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

module "gcp_resourceLocations" {
  source             = "../module/list_policy"
  name               = var.gcp_resourceLocations_name
  scope              = var.gcp_resourceLocations_scope
  ids                = var.gcp_resourceLocations_scope == "organization" ? [var.organization_id] : var.gcp_resourceLocations_ids
  allowed_values     = var.gcp_resourceLocations_allowed_values
  denied_values      = var.gcp_resourceLocations_denied_values
  allowed_conditions = var.gcp_resourceLocations_allowed_conditions
  denied_conditions  = var.gcp_resourceLocations_denied_conditions
}

