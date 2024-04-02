variable "compute_workloadIdentityPoolProviders_name" {
  type    = string
  default = "policies/iam.workloadIdentityPoolProviders"
}

variable "compute_workloadIdentityPoolProviders_scope" {
  type    = string
  default = "organization"
}

variable "compute_workloadIdentityPoolProviders_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "compute_workloadIdentityPoolProviders_allowed_values" {
  type    = list(string)
  default = []
}

variable "compute_workloadIdentityPoolProviders_denied_values" {
  type    = list(string)
  default = []
}

variable "compute_workloadIdentityPoolProviders_allowed_conditions" {
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

variable "compute_workloadIdentityPoolProviders_denied_conditions" {
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

module "compute_workloadIdentityPoolProviders" {
  source             = "../module/list_policy"
  name               = var.compute_workloadIdentityPoolProviders_name
  scope              = var.compute_workloadIdentityPoolProviders_scope
  ids                = var.compute_workloadIdentityPoolProviders_scope == "organization" ? [var.organization_id] : var.compute_workloadIdentityPoolProviders_ids
  allowed_values     = var.compute_workloadIdentityPoolProviders_allowed_values
  denied_values      = var.compute_workloadIdentityPoolProviders_denied_values
  allowed_conditions = var.compute_workloadIdentityPoolProviders_allowed_conditions
  denied_conditions  = var.compute_workloadIdentityPoolProviders_denied_conditions
}

