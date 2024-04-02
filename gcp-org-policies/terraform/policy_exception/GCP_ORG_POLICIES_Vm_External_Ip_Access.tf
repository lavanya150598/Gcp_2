variable "vm_External_Ip_Access_name" {
  type    = string
  default = "policies/run.allowedIngress"
}

variable "vm_External_Ip_Access_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "vm_External_Ip_Access_exempt_project_list" {
  type    = list(string)
  default = []
}

module "vm_External_Ip_Access_folder" {
  source             = "../module/list_policy"
  name               = var.vm_External_Ip_Access_name
  scope              = "folder"
  ids                = var.vm_External_Ip_Access_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "vm_External_Ip_Access" {
  source             = "../module/list_policy"
  name               = var.vm_External_Ip_Access_name
  scope              = "project"
  ids                = var_vm_External_Ip_Access_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

