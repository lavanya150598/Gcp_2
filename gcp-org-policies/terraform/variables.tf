variable "region" {}

variable "project_id" {}

variable "env" {}

variable "organization_id" {}

variable "builds" {
  type = map(object({
    name   = string
    folder = string
    type   = string
  }))
  default = {
    "binary-policy-org" = {
      name   = "policy-org-default"
      folder = "policy_org_default"
      type   = "push"
    },
    "binary-policy-exception" = {
      name   = "policy-exception"
      folder = "policy_exception"
      type   = "push"
    },
    "binary-policy-custom" = {
      name   = "policy-custom"
      folder = "policy_custom"
      type   = "push"
    },
    "custom-iam-constraint-policy" = {
      name   = "custom-iam-constraint-policy"
      folder = "custom-iam-constraint-policy"
      type   = "push"
    }
  }
}

