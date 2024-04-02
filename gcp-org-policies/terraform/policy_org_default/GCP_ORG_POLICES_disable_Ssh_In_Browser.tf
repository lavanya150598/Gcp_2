variable "disable_Ssh_In_Browser_name" {
  type    = string
  default = "policies/compute.disableSshInBrowser"
}

variable "disable_Ssh_In_Browser_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "disable_Ssh_In_Browser_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "disable_Ssh_In_Browser" {
  source             = "../module/binary_policy"
  name               = var.disable_Ssh_In_Browser_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.disable_Ssh_In_Browser_allowed_conditions
  denied_conditions  = var.disable_Ssh_In_Browser_denied_conditions
}