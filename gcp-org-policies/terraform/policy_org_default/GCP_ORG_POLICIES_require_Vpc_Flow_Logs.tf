locals {
    metadata = {
      version = "1.0.0"
      priority = "Critical"
      customComplianceRef = "GCPPLAT_GAR_02"
      customComplianceCacRef = "GCP_TFSENTINEL_GAR_120_001.sentinel"
      policyDescription = "To enable Vpc Flow Logs  you can monitor and analyze network traffic within your Virtual Private Cloud (VPC) for security and troubleshooting purposes"
    }
}
variable "iam_require_Vpc_Flow_Logs_name" {
  type    = string
  default = "policies/iam.require_Vpc_Flow_Logs"
}

variable "iam_require_Vpc_Flow_Logs_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "iam_require_Vpc_Flow_Logs_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "iam_require_Vpc_Flow_Logs" {
  source             = "../module/binary_policy"
  name               = var.iam_require_Vpc_Flow_Logs_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.iam_require_Vpc_Flow_Logs_allowed_conditions
  denied_conditions  = var.iam_require_Vpc_Flow_Logs_denied_conditions
}