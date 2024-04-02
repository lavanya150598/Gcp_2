variable "restrict_protocol_Forwarding_Creation_For_name" {
  type    = string
  default = "policies/iam.restrict_protocol_Forwarding_Creation_For"
}

variable "restrict_protocol_Forwarding_Creation_For_exempt_folder_list" {
  type    = list(string)
  default = []
}

variable "restrict_protocol_Forwarding_Creation_For_exempt_project_list" {
  type    = list(string)
  default = []
}

module "restrict_protocol_Forwarding_Creation_For_folder" {
  source             = "../module/list_policy"
  name               = var.restrict_protocol_Forwarding_Creation_For_name
  scope              = "folder"
  ids                = var.restrict_protocol_Forwarding_Creation_For_exempt_folder_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

module "restrict_protocol_Forwarding_Creation_For_project" {
  source             = "../module/list_policy"
  name               = var.restrict_protocol_Forwarding_Creation_For_name
  scope              = "project"
  ids                = var.restrict_protocol_Forwarding_Creation_For_exempt_project_list
  allowed_values     = []
  denied_values      = []
  allowed_conditions = []
  denied_conditions  = []
}

