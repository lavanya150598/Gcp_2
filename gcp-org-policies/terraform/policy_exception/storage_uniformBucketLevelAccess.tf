variable "storage_uniformBucketLevelAccess_name" {
  type    = string
  default = "policies/storage.uniformBucketLevelAccess"
}

variable "storage_uniformBucketLevelAccess_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "storage_uniformBucketLevelAccess_exempt_project_list" {
  type    = list(string)
  default = []
}

module "storage_uniformBucketLevelAccess_folder" {
  source             = "../module/binary_policy"
  name               = var.storage_uniformBucketLevelAccess_name
  scope              = "folder"
  ids                = var.storage_uniformBucketLevelAccess_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "storage_uniformBucketLevelAccess_project" {
  source             = "../module/binary_policy"
  name               = var.storage_uniformBucketLevelAccess_name
  scope              = "project"
  ids                = var.storage_uniformBucketLevelAccess_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
