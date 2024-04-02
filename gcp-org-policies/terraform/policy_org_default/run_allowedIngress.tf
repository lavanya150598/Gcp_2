variable "run_allowedIngress_name" {
  type    = string
  default = "policies/run.allowedIngress"
}

variable "run_allowedIngress_scope" {
  type    = string
  default = "organization"
}

variable "run_allowedIngress_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "run_allowedIngress_allowed_values" {
  type    = list(string)
  default = []
}

variable "run_allowedIngress_denied_values" {
  type    = list(string)
  default = []
}

variable "run_allowedIngress_allowed_conditions" {
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

variable "run_allowedIngress_denied_conditions" {
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

module "run_allowedIngress" {
  source             = "../module/list_policy"
  name               = var.run_allowedIngress_name
  scope              = var.run_allowedIngress_scope
  ids                = var.run_allowedIngress_scope == "organization" ? [var.organization_id] : var.run_allowedIngress_ids
  allowed_values     = var.run_allowedIngress_allowed_values
  denied_values      = var.run_allowedIngress_denied_values
  allowed_conditions = var.run_allowedIngress_allowed_conditions
  denied_conditions  = var.run_allowedIngress_denied_conditions
}

