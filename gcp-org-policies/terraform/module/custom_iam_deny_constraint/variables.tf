variable "organization_id" {}

variable "iam_deny_constraint" {
  type = object({
    name         = string
    display_name = string
    description  = string
    denied_roles = list(string)
  })
}
