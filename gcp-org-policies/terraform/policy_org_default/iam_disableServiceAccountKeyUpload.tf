variable "iam_disableServiceAccountKeyUpload_name" {
  type    = string
  default = "policies/iam.disableServiceAccountKeyUpload"
}

variable "iam_disableServiceAccountKeyUpload_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "iam_disableServiceAccountKeyUpload_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "iam_disableServiceAccountKeyUpload" {
  source             = "../module/binary_policy"
  name               = var.iam_disableServiceAccountKeyUpload_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.iam_disableServiceAccountKeyUpload_allowed_conditions
  denied_conditions  = var.iam_disableServiceAccountKeyUpload_denied_conditions
}