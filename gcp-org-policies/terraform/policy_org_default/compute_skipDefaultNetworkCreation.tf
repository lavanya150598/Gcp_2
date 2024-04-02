variable "compute_skipDefaultNetworkCreation_name" {
  type    = string
  default = "policies/compute.skipDefaultNetworkCreation"
}

variable "compute_skipDefaultNetworkCreation_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "compute_skipDefaultNetworkCreation_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "compute_skipDefaultNetworkCreation" {
  source             = "../module/binary_policy"
  name               = var.compute_skipDefaultNetworkCreation_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.compute_skipDefaultNetworkCreation_allowed_conditions
  denied_conditions  = var.compute_skipDefaultNetworkCreation_denied_conditions
}