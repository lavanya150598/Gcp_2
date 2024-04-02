variable "scope" {
  type = string
}

variable "id" {
  type = string
}

variable "resource_lifecycle_tags" {
  type = object({
    name = string
    desc = string
  })
}

variable "resource_lifecycle_values" {
  type = map(object({
    value = string
    desc  = string
  }))
}

