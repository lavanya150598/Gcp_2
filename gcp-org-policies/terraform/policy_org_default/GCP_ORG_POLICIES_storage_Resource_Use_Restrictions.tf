locals {
    metadata = {
      version = "1.0.0"
      priority = "Critical"
      customComplianceRef = "GCPPLAT_GAR_02"
      customComplianceCacRef = "GCP_TFSENTINEL_GAR_120_001.sentinel"
      policyDescription = " involves implementing IAM policies to control and restrict access to storage resources such as buckets and objects."
    }
}
variable "iam_storage_Resource_Use_Restriction_name" {
  type    = string
  default = "policies/iam.storage_Resource_Use_Restriction"
}

variable "iam_storage_Resource_Use_Restriction_scope" {
  type    = string
  default = "organization"
}

variable "iam_storage_Resource_Use_Restriction_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "iam_storage_Resource_Use_Restriction_allowed_values" {
  type    = list(string)
  default = []
}

variable "iam_storage_Resource_Use_Restriction_denied_values" {
  type    = list(string)
  default = []
}

variable "iam_storage_Resource_Use_Restriction_allowed_conditions" {
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

variable "iam_storage_Resource_Use_Restriction_denied_conditions" {
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

module "iam_storage_Resource_Use_Restriction" {
  source             = "../module/list_policy"
  name               = var.iam_storage_Resource_Use_Restriction_name
  scope              = var.iam_storage_Resource_Use_Restriction_scope
  ids                = var.iam_storage_Resource_Use_Restriction_scope == "organization" ? [var.organization_id] : var.iam_allowServiceAccountCredentialLifetimeExtension_ids
  allowed_values     = var.iam_storage_Resource_Use_Restriction_allowed_values
  denied_values      = var.iam_storage_Resource_Use_Restriction_denied_values
  allowed_conditions = var.iam_storage_Resource_Use_Restriction_allowed_conditions
  denied_conditions  = var.iam_storage_Resource_Use_Restriction_denied_conditions
}
