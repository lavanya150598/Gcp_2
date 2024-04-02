variable "sql_restrictAuthorizedNetworks_name" {
  type    = string
  default = "policies/sql.restrictAuthorizedNetworks"
}

variable "sql_restrictAuthorizedNetworks_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "sql_restrictAuthorizedNetworks_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "sql_restrictAuthorizedNetworks" {
  source             = "../module/binary_policy"
  name               = var.sql_restrictAuthorizedNetworks_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.sql_restrictAuthorizedNetworks_allowed_conditions
  denied_conditions  = var.sql_restrictAuthorizedNetworks_denied_conditions
}