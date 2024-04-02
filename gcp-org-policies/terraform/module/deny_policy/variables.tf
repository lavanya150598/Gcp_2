variable "name" {
  type = string
}

variable "policy_id" {
  type = string
}

variable "scope" {
  type = string
}

variable "ids" {
  type = list(string)
}


variable "deny_rules" {
  type = list(object({
    rule = object({
      description                 = string
      denied_principals           = list(string)
      denied_permissions          = list(string)
      exception_principals        = list(string)
      denied_condition_expression = string
    })
  }))
  default = []
}