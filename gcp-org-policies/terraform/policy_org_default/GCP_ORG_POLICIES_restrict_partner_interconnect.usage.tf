locals {
    metadata = {
      version = "1.0.0"
      priority = "Critical"
      customComplianceRef = "GCPPLAT_GAR_02"
      customComplianceCacRef = "GCP_TFSENTINEL_GAR_120_001.sentinel"
      policyDescription = "To restrict Partner Interconnect usage employ IAM roles to manage access and permissions for users or service accounts"
    }
}
variable "restrict_partner_interconnect_usage" {
  type    = string
  default = "policies/restrict_partner_interconnect_usage"
}

variable "restrict_partner_interconnect_usage" {
  type    = string
  default = "organization"
}

variable "restrict_partner_interconnect_usage_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "restrict_partner_interconnect_usage_ids_allowed_values" {
  type    = list(string)
  default = []
}

variable "restrict_partner_interconnect_usage_ids_denied_values" {
  type    = list(string)
  default = []
}

variable "restrict_partner_interconnect_usage_ids_allowed_values_allowed_conditions" {
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

variable "restrict_partner_interconnect_usage_denied_conditions" {
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

module "restrict_partner_interconnect_usage" {
  source             = "../module/list_policy"
  name               = var.restrict_partner_interconnect_usage_name
  scope              = var.restrict_partner_interconnect_usage_scope
  ids                = var.restrict_partner_interconnect_usage_scope == "organization" ? [var.organization_id] : var.run_allowedIngress_ids
  allowed_values     = var.restrict_partner_interconnect_usage_allowed_values
  denied_values      = var.restrict_partner_interconnect_usage_denied_values
  allowed_conditions = var.restrict_partner_interconnect_usage_allowed_conditions
  denied_conditions  = var.restrict_partner_interconnect_usage_denied_conditions
}

