locals {
    metadata = {
      version = "1.0.0"
      priority = "Critical"
      customComplianceRef = "GCPPLAT_GAR_02"
      customComplianceCacRef = "GCP_TFSENTINEL_GAR_120_001.sentinel"
      policyDescription = "
To restrict Cloud NAT usage you can use IAM roles to limit access to users or service accounts"
    }
}
variable "iam_restrict_Cloud_NAT_Usage_name" {
  type    = string
  default = "policies/iam.restrict_Cloud_NAT_Usage"
}

variable "iam_restrict_Cloud_NAT_Usage_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "iam_restrict_Cloud_NAT_Usage_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "iam_restrict_Cloud_NAT_Usage" {
  source             = "../module/binary_policy"
  name               = var.iam_restrict_Cloud_NAT_Usage_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.iam_restrict_Cloud_NAT_Usage_allowed_conditions
  denied_conditions  = var.iam_restrict_Cloud_NAT_Usage_denied_conditions
}