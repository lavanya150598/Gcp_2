locals {
    metadata = {
      version = "1.0.0"
      priority = "Critical"
      customComplianceRef = "GCPPLAT_GAR_02"
      customComplianceCacRef = "GCP_TFSENTINEL_GAR_120_001.sentinel"
      policyDescription = "vm External Ip Access the ability of a virtual machine (VM) to communicate externally over the internet using its assigned external IP address"
    }
}
variable "iam_vm_External_IP_Access_name" {
  type    = string
  default = "cloudresourcemanager.googleapis.com"
}

variable "iam_vm_External_IP_Access_scope" {
  type    = string
  default = "organization"
}

variable "iam_vm_External_IP_Access_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "iam_vm_External_IP_Access_rules" {
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

module "iam_vm_External_IP_Access" {
  source     = "../module/deny_policy"
  policy_id  = "iam-vm_External_IP_Access"
  name       = var.iam_vm_External_IP_Access_name
  scope      = var.iam_vm_External_IP_Access_scope
  ids        = var.iam_vm_External_IP_Access_ids
  deny_rules = var.iam_vm_External_IP_Access_rules
}

