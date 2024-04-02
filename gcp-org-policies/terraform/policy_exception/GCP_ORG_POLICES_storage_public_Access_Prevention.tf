variable "storage_public_Access_Prevention_name" {
  type    = string
  default = "policies/storage.publicAccessPrevention"
}

variable "storage_public_Access_Prevention_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "storage_public_Access_Prevention_exempt_project_list" {
  type    = list(string)
  default = []
}


module "storage_public_Access_Prevention_folder" {
  source             = "../module/binary_policy"
  name               = var.storage_public_Access_Prevention_name
  scope              = "folder"
  ids                = var.storage_public_Access_Prevention_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "storage_public_Access_Prevention" {
  source             = "../module/binary_policy"
  name               = var.storage_public_Access_Prevention_name
  scope              = "project"
  ids                = var.storage_public_Access_Prevention_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
