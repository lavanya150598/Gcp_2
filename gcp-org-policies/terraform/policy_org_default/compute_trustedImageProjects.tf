variable "compute_trustedImageProjects_name" {
  type    = string
  default = "policies/compute.trustedImageProjects"
}

variable "compute_trustedImageProjects_scope" {
  type    = string
  default = "organization"
}

variable "compute_trustedImageProjects_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "compute_trustedImageProjects_allowed_values" {
  type    = list(string)
  default = []
}

variable "compute_trustedImageProjects_denied_values" {
  type    = list(string)
  default = []
}

variable "compute_trustedImageProjects_allowed_conditions" {
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

variable "compute_trustedImageProjects_denied_conditions" {
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

module "compute_trustedImageProjects" {
  source             = "../module/list_policy"
  name               = var.compute_trustedImageProjects_name
  scope              = var.compute_trustedImageProjects_scope
  ids                = var.compute_trustedImageProjects_scope == "organization" ? [var.organization_id] : var.compute_trustedImageProjects_ids
  allowed_values     = var.compute_trustedImageProjects_allowed_values
  denied_values      = var.compute_trustedImageProjects_denied_values
  allowed_conditions = var.compute_trustedImageProjects_allowed_conditions
  denied_conditions  = var.compute_trustedImageProjects_denied_conditions
}

