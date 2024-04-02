locals {
    metadata = {
      version = "1.0.0"
      priority = "Critical"
      customComplianceRef = "GCPPLAT_GAR_02"
      customComplianceCacRef = "GCP_TFSENTINEL_GAR_120_001.sentinel"
      policyDescription = "
Mandatory operating system login for user authentication and access control"
    }
}
variable "require_Os_Login_name" {
  type    = string
  default = "policies/compute.reuireOsLogin"
}

variable "require_Os_Login" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "require_Os_Login_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "require_Os_Login" {
  source             = "../module/binary_policy"
  name               = var.require_Os_Login_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.require_Os_Login_allowed_conditions
  denied_conditions  = var.require_Os_Login_denied_conditions
}