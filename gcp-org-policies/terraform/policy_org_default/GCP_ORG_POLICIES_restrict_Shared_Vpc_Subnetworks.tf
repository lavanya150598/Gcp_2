locals {
    metadata = {
      version = "1.0.0"
      priority = "Critical"
      customComplianceRef = "GCPPLAT_GAR_02"
      customComplianceCacRef = "GCP_TFSENTINEL_GAR_120_001.sentinel"
      policyDescription = "Shared Vpc Sunnetworks allow organizations to share networking resources across projects while maintaining isolation at the subnet level"
    }
}
variable "iam_restrict_Shared_Vpc_Subnetworks_name" {
  type    = string
  default = "policies/iam_restrict_Shared_Vpc_Subnetworks"
}

variable "iam_restrict_Shared_Vpc_Subnetworks_scope" {
  type    = string
  default = "organization"
}

variable "iam_restrict_Shared_Vpc_Subnetworks_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "iam_restrict_Shared_Vpc_Subnetworks_allowed_values" {
  type    = list(string)
  default = []
}

variable "iam_restrict_Shared_Vpc_Subnetworks_denied_values" {
  type    = list(string)
  default = []
}

variable "iam_restrict_Shared_Vpc_Subnetworks_allowed_conditions" {
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

variable "iam_restrict_Shared_Vpc_Subnetworks_denied_conditions" {
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

module "iam_restrict_Shared_Vpc_Subnetworks" {
  source             = "../module/list_policy"
  name               = var.iam_restrict_Shared_Vpc_Subnetworks_name
  scope              = var.iam_restrict_Shared_Vpc_Subnetworks_scope
  ids                = var.iam_restrict_Shared_Vpc_Subnetworks_scope == "organization" ? [var.organization_id] : var.iam_allowServiceAccountCredentialLifetimeExtension_ids
  allowed_values     = var.iam_restrict_Shared_Vpc_Subnetworks_allowed_values
  denied_values      = var.iam_restrict_Shared_Vpc_Subnetworks_denied_values
  allowed_conditions = var.iam_restrict_Shared_Vpc_Subnetworks_allowed_conditions
  denied_conditions  = var.iam_restrict_Shared_Vpc_Subnetworks_denied_conditions
}
