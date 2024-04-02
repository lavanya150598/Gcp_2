variable "disable_Audit_Logging_Exemption_name" {
  type    = string
  default = "policies/iam.disableAuditLoggingExemption"
}

variable "disable_Audit_Logging_Exemption_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "disable_Audit_Logging_Exemption_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "disable_Audit_Logging_Exemption" {
  source             = "../module/binary_policy"
  name               = var.disable_Audit_Logging_Exemption_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.disable_Audit_Logging_Exemption_allowed_conditions
  denied_conditions  = var.disable_Audit_Logging_Exemption_denied_conditions
}