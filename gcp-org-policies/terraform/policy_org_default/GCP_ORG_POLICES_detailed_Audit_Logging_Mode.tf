variable "GCP_ORG_POLICES_detailed_Audit_Logging_Mode" {
  type    = string
  default = "policies/gcp.detailedAuditLoggingMode"
}

variable "GCP_ORG_POLICES_detailed_Audit_Logging_Mode_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "GCP_ORG_POLICES_detailed_Audit_Logging_Mode_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "GCP_ORG_POLICES_detailed_Audit_Logging_Mode" {
  source             = "../module/binary_policy"
  name               = var.GCP_ORG_POLICES_detailed_Audit_Logging_Mode
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.GCP_ORG_POLICES_detailed_Audit_Logging_Mode_allowed_conditions
  denied_conditions  = var.GCP_ORG_POLICES_detailed_Audit_Logging_Mode_denied_conditions
}