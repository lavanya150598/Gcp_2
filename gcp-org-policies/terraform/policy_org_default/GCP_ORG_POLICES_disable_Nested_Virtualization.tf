variable "disable_Nested_Virtualization_name" {
  type    = string
  default = "policies/compute.disableNestedVirtualization"
}

variable "disable_Nested_Virtualization_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "disable_Nested_Virtualization_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "disable_Nested_Virtualization" {
  source             = "../module/binary_policy"
  name               = var.disable_Nested_Virtualization_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.disable_Nested_Virtualization_allowed_conditions
  denied_conditions  = var.disable_Nested_Virtualization_denied_conditions
}