variable "detailed_Audit_Logging_Mode" {
  type    = string
  default = "policies/gcp.detailedAuditLoggingMode"
}

variable "detailed_Audit_Logging_Mode_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "detailed_Audit_Logging_Mode_exempt_project_list" {
  type    = list(string)
  default = []
}


module "detailed_Audit_Logging_Mode_folder" {
  source             = "../module/binary_policy"
  name               = var.detailed_Audit_Logging_Mode
  scope              = "folder"
  ids                = var.detailed_Audit_Logging_Mode_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "detailed_Audit_Logging_Mode_project" {
  source             = "../module/binary_policy"
  name               = var.detailed_Audit_Logging_Mode
  scope              = "project"
  ids                = var.detailed_Audit_Logging_Mode_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
