variable "storage_public_Access_Prevention_name" {
  type    = string
  default = "policies/storage.publicAccessPrevention"
}

variable "storage_public_Access_Prevention_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "storage_public_Access_Prevention_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "storage_public_Access_Prevention" {
  source             = "../module/binary_policy"
  name               = var.storage_public_Access_Prevention_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.storage_public_Access_Prevention_allowed_conditions
  denied_conditions  = var.storage_public_Access_Prevention_denied_conditions
}