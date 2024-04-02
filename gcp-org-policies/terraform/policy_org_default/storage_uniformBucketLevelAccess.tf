variable "storage_uniformBucketLevelAccess_name" {
  type    = string
  default = "policies/storage.uniformBucketLevelAccess"
}

variable "storage_uniformBucketLevelAccess_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "storage_uniformBucketLevelAccess_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "storage_uniformBucketLevelAccess" {
  source             = "../module/binary_policy"
  name               = var.storage_uniformBucketLevelAccess_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.storage_uniformBucketLevelAccess_allowed_conditions
  denied_conditions  = var.storage_uniformBucketLevelAccess_denied_conditions
}