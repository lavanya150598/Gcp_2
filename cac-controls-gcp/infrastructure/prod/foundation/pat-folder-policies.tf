// pat-folder id 662810143325 
module "allowed_Policy_Member_Domains_pat" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  folder_id       = 662810143325
  policy_for      = "folder"
  policy_type     = "list"
  # enforce         = "true"
  allow = [
    "C02mokb7t", // td.com customer id
    "C02k6gbf4", // pat-td.com customer id
  ]
  allow_list_length = 1
  constraint        = "constraints/iam.allowedPolicyMemberDomains"
  exclude_folders   = var.exclude_folders
}
