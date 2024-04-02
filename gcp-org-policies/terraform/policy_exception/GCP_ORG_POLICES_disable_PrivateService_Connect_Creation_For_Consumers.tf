variable "disable_PrivateService_Connect_Creation_For_Consumers_name" {
  type    = string
  default = "policies/compute.disablePrivateServiceConnectCreationForConsumers"
}

variable "disable_PrivateService_Connect_Creation_For_Consumers_scope" {
  type    = string
  default = "organization"
}

variable "disable_PrivateService_Connect_Creation_For_Consumers_ids" {
  type    = list(string)
  default = []
}

variable "disable_PrivateService_Connect_Creation_For_Consumers_allowed_values" {
  type    = list(string)
  default = []
}

variable "disable_PrivateService_Connect_Creation_For_Consumers_denied_values" {
  type    = list(string)
  default = []
}

variable "disable_PrivateService_Connect_Creation_For_Consumers_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
    values = object({
      allowed_values = list(string)
      denied_values  = list(string)
    })
  }))
  default = []
}

variable "disable_PrivateService_Connect_Creation_For_Consumers_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
    values = object({
      allowed_values = list(string)
      denied_values  = list(string)
    })
  }))
  default = []
}

module "disable_PrivateService_Connect_Creation_For_Consumers" {
  source             = "../module/list_policy"
  name               = var.disable_PrivateService_Connect_Creation_For_Consumers_name
  scope              = var.disable_PrivateService_Connect_Creation_For_Consumers_scope
  ids                = var.disable_PrivateService_Connect_Creation_For_Consumers_scope == "organization" ? [var.organization_id] : var.disable_PrivateService_Connect_Creation_For_Consumers_ids
  allowed_values     = var.disable_PrivateService_Connect_Creation_For_Consumers_allowed_values
  denied_values      = var.disable_PrivateService_Connect_Creation_For_Consumers_denied_values
  allowed_conditions = var.disable_PrivateService_Connect_Creation_For_Consumers_allowed_conditions
  denied_conditions  = var.disable_PrivateService_Connect_Creation_For_Consumers_denied_conditions
}

