variable "compute_restrictXpnProjectLienRemoval_name" {
  type    = string
  default = "policies/compute.restrictXpnProjectLienRemoval"
}

variable "compute_restrictXpnProjectLienRemoval_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "compute_restrictXpnProjectLienRemoval_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "compute_restrictXpnProjectLienRemoval" {
  source             = "../module/binary_policy"
  name               = var.compute_restrictXpnProjectLienRemoval_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.compute_restrictXpnProjectLienRemoval_allowed_conditions
  denied_conditions  = var.compute_restrictXpnProjectLienRemoval_denied_conditions
}