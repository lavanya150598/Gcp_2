variable "project_id" {
  default = "org-policy-pr-6818c0"
}

variable "organization_id" {
  default = "637987714668"
}

variable "iam_deny_constraint" {
  type = map(object({
    name         = string
    display_name = string
    description  = string
    denied_roles = list(string)
  }))
}
