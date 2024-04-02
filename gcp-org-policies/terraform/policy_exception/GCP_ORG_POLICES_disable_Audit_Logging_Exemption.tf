variable "disable_Audit_Logging_Exemption_name" {
  type    = string
  default = "policies/iam.disableAuditLoggingExemption"
}

variable "disable_Audit_Logging_Exemption_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "disable_Audit_Logging_Exemption_exempt_project_list" {
  type    = list(string)
  default = []
}


module "disable_Audit_Logging_Exemption_folder" {
  source             = "../module/binary_policy"
  name               = var.disable_Audit_Logging_Exemption_name
  scope              = "folder"
  ids                = var.disable_Audit_Logging_Exemption_exempt_folder_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}

module "disable_Audit_Logging_Exemption_project" {
  source             = "../module/binary_policy"
  name               = var.disable_Audit_Logging_Exemption_name
  scope              = "project"
  ids                = var.disable_Audit_Logging_Exemption_exempt_project_list
  enforce_policy_ind = false
  allowed_conditions = []
  denied_conditions  = []
}
