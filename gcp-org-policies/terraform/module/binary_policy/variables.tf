variable "name" {
  type = string
}

variable "scope" {
  type = string
}

variable "ids" {
  type = list(string)
}

variable "enforce_policy_ind" {
  type = bool
}

variable "allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}
