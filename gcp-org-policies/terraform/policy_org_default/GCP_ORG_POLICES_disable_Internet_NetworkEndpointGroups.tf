variable "disable_Internet_NetworkEndpointGroups_name" {
  type    = string
  default = "policies/compute.disableInternetNetworkEndpointGroup"
}

variable "disable_Internet_NetworkEndpointGroups_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "disable_Internet_NetworkEndpointGroups_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "disable_Internet_NetworkEndpointGroups" {
  source             = "../module/binary_policy"
  name               = var.disable_Internet_NetworkEndpointGroups_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.disable_Internet_NetworkEndpointGroups_allowed_conditions
  denied_conditions  = var.disable_Internet_NetworkEndpointGroups_denied_conditions
}