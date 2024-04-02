variable "iam_disableServiceAccountKeyCreation_name" {
  type    = string
  default = "policies/iam.disableServiceAccountKeyCreation"
}

variable "iam_disableServiceAccountKeyCreation_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "iam_disableServiceAccountKeyCreation_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "iam_disableServiceAccountKeyCreation" {
  source             = "../module/binary_policy"
  name               = var.iam_disableServiceAccountKeyCreation_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.iam_disableServiceAccountKeyCreation_allowed_conditions
  denied_conditions  = var.iam_disableServiceAccountKeyCreation_denied_conditions
}