variable "disable_GlobalSerial_Port_Access_name" {
  type    = string
  default = "policies/iam.disableServiceAccountKeyCreation"
}

variable "disable_GlobalSerial_Port_Access_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "disable_GlobalSerial_Port_Access_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "disable_GlobalSerial_Port_Access" {
  source             = "../module/binary_policy"
  name               = var.disable_GlobalSerial_Port_Access_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.disable_GlobalSerial_Port_Access_allowed_conditions
  denied_conditions  = var.disable_GlobalSerial_Port_Access_denied_conditions
}