variable "restrict_Protocol_Forwarding_Creation_For_name" {
  type    = string
  default = "policies/iam.restrict_Protocol_Forwarding_Creation_For"
}

variable "restrict_Protocol_Forwarding_Creation_For_scope" {
  type    = string
  default = "organization"
}

variable "restrict_Protocol_Forwarding_Creation_For_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "restrict_Protocol_Forwarding_Creation_For_allowed_values" {
  type    = list(string)
  default = []
}

variable "restrict_Protocol_Forwarding_Creation_For_denied_values" {
  type    = list(string)
  default = []
}

variable "restrict_Protocol_Forwarding_Creation_For_allowed_conditions" {
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

variable "restrict_Protocol_Forwarding_Creation_For_denied_conditions" {
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

module "restrict_Protocol_Forwarding_Creation_For" {
  source             = "../module/list_policy"
  name               = var.restrict_Protocol_Forwarding_Creation_For_name
  scope              = var.restrict_Protocol_Forwarding_Creation_For_scope
  ids                = var.restrict_Protocol_Forwarding_Creation_For_scope == "organization" ? [var.organization_id] : var.compute_workloadIdentityPoolProviders_ids
  allowed_values     = var.restrict_Protocol_Forwarding_Creation_For_allowed_values
  denied_values      = var.restrict_Protocol_Forwarding_Creation_For_denied_values
  allowed_conditions = var.restrict_Protocol_Forwarding_Creation_For_allowed_conditions
  denied_conditions  = var.restrict_Protocol_Forwarding_Creation_For_denied_conditions
}

