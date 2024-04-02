variable "name" {
  type = string
}

variable "scope" {
  type = string
}

variable "ids" {
  type = list(string)
}

variable "allowed_values" {
  type = list(string)
}

variable "denied_values" {
  type = list(string)
}

variable "allowed_conditions" {
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

variable "denied_conditions" {
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