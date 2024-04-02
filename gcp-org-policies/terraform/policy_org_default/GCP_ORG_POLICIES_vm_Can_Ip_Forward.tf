locals {
    metadata = {
      version = "1.0.0"
      priority = "Critical"
      customComplianceRef = "GCPPLAT_GAR_02"
      customComplianceCacRef = "GCP_TFSENTINEL_GAR_120_001.sentinel"
      policyDescription =" Vm Can IP refers to the capability for a virtual machine (VM) to forward packets at the IP layer. This feature allows VMs to act as routers or gateways."
    }
}
variable "iam_vm_Can_Ip_Forward_name" {
  type    = string
  default = "policies/iam.vm_Can_Ip_Forward"
}

variable "iam_vm_Can_Ip_Forward_scope" {
  type    = string
  default = "organization"
}

variable "iam_vm_Can_Ip_Forward_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "iam_vm_Can_Ip_Forward_allowed_values" {
  type    = list(string)
  default = []
}

variable "iam_vm_Can_Ip_Forward_denied_values" {
  type    = list(string)
  default = []
}

variable "iam_vm_Can_Ip_Forward_allowed_conditions" {
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

variable "iam_vm_Can_Ip_Forward_denied_conditions" {
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

module "iam_vm_Can_Ip_Forward" {
  source             = "../module/list_policy"
  name               = var.iam_vm_Can_Ip_Forward_name
  scope              = var.iam_vm_Can_Ip_Forward_scope
  ids                = var.iam_vm_Can_Ip_Forward_scope == "organization" ? [var.organization_id] : var.iam_allowedPolicyMemberDomains_ids
  allowed_values     = var.iam_vm_Can_Ip_Forward_allowed_values
  denied_values      = var.iam_vm_Can_Ip_Forward_denied_values
  allowed_conditions = var.iam_vm_Can_Ip_Forward_allowed_conditions
  denied_conditions  = var.iam_vm_Can_Ip_Forward_denied_conditions
}

