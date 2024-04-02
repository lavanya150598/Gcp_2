// pat-folder id 273598296861 
module "allowed_Policy_Member_Domains_dev" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  folder_id       = 273598296861
  policy_for      = "folder"
  policy_type     = "list"
  # enforce         = "true"
  allow = [
    "C02mokb7t", // td.com customer id
    "C03yaer81", // dev-td.com customer id
  ]
  allow_list_length = 1
  constraint        = "constraints/iam.allowedPolicyMemberDomains"
  exclude_folders   = var.exclude_folders
}
