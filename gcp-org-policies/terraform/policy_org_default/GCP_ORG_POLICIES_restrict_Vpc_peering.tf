locals {
    metadata = {
      version = "1.0.0"
      priority = "Critical"
      customComplianceRef = "GCPPLAT_GAR_02"
      customComplianceCacRef = "GCP_TFSENTINEL_GAR_120_001.sentinel"
      policyDescription = "VPC Peering it enables secure communication between Virtual Private Cloud (VPC) networks."
    }
}
variable "iam_restrict_Vpc_Peering_name" {
  type    = string
  default = "cloudresourcemanager.googleapis.com"
}

variable "iam_restrict_Vpc_Peering_scope" {
  type    = string
  default = "organization"
}

variable "iam_restrict_Vpc_Peering_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "iam_restrict_Vpc_Peering_rules" {
  type = list(object({
    rule = object({
      description                 = string
      denied_principals           = list(string)
      denied_permissions          = list(string)
      exception_principals        = list(string)
      denied_condition_expression = string
    })
  }))
  default = []
}

module "iam_restrict_Vpc_Peering" {
  source     = "../module/deny_policy"
  policy_id  = "iam-restrict_Vpc_Peering"
  name       = var.iam_restrict_Vpc_Peering_name
  scope      = var.iam_restrict_Vpc_Peering_scope
  ids        = var.iam_restrict_Vpc_Peering_ids
  deny_rules = var.iam_restrict_Vpc_Peering_rules
}

