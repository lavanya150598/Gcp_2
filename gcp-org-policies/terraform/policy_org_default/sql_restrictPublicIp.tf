variable "sql_restrictPublicIp_name" {
  type    = string
  default = "policies/sql.restrictPublicIp"
}

variable "sql_restrictPublicIp_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "sql_restrictPublicIp_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "sql_restrictPublicIp" {
  source             = "../module/binary_policy"
  name               = var.sql_restrictPublicIp_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.sql_restrictPublicIp_allowed_conditions
  denied_conditions  = var.sql_restrictPublicIp_denied_conditions
}