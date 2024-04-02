locals {
  organization_id = var.parent_folder != "" ? null : var.org_id
  folder_id       = var.parent_folder != "" ? var.parent_folder : null
  policy_for      = var.parent_folder != "" ? "folder" : "organization"
}

// Adding a comment
//IFPUCGCP-306	
module "restrict_resource_locations" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.allowed_resource_location
  allow_list_length = length(var.allowed_resource_location)
  constraint        = "constraints/gcp.resourceLocations"
  #   exclude_projects = []
}

//IFPUCGCP-283	
module "restrict_service_usage" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.allowed_services
  allow_list_length = length(var.allowed_services)
  constraint        = "constraints/gcp.restrictServiceUsage"
  #   exclude_projects = []
}

//IFPUCGCP-80

module "detailed_Audit_Logging_Mode" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  #   folder_id        = local.folder_id
  policy_for  = "organization"
  policy_type = "boolean"
  enforce     = "true"
  constraint  = "constraints/gcp.detailedAuditLoggingMode"
  #   exclude_projects = []
}

//IFPUCGCP-168

module "disable_GlobalSerial_Port_Access" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  #   folder_id        = local.folder_id
  policy_for  = "organization"
  policy_type = "boolean"
  enforce     = "true"
  constraint  = "constraints/compute.disableGlobalSerialPortAccess"
  #   exclude_projects = []
}

//IFPUCGCP-86
module "restrict_Xpn_Project_Lien_Removal" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  #   folder_id        = local.folder_id
  policy_for  = "organization"
  policy_type = "boolean"
  enforce     = "true"
  constraint  = "constraints/compute.restrictXpnProjectLienRemoval"
  #   exclude_projects = []
}

//IFPUCGCP-324
module "essentialcontacts_allowedContact_Domains" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.allowed_contact_domains_suffix
  allow_list_length = length(var.allowed_contact_domains_suffix)
  constraint        = "constraints/essentialcontacts.allowedContactDomains"
  #   exclude_projects = []
}

//IFPUCGCP-255
module "iam_automatic_Iam_Grants_For_Default_ServiceAccounts" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  policy_for      = "organization"
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/iam.automaticIamGrantsForDefaultServiceAccounts"
  #   exclude_projects = []
}

//IFPUCGCP-129
module "allowed_Policy_Member_Domains" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  #  folder_id       = local.folder_id
  policy_for      = "organization"
  policy_type     = "list"
  #  enforce         = "true"
  allow            = var.allowed_policy_member_domains_customerid
  allow_list_length = length(var.allowed_policy_member_domains_customerid)
  constraint      = "constraints/iam.allowedPolicyMemberDomains"
  exclude_folders   = var.exclude_folders
}

// IFPUCGCP-413
module "storage_public_Access_Prevention" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  #   folder_id        = local.folder_id
  policy_for  = "organization"
  policy_type = "boolean"
  enforce     = "true"
  constraint  = "constraints/storage.publicAccessPrevention"
  #   exclude_projects = []
}

// IFPUCGCP-415
# module "storage_retention_Policy_Seconds" {
#   source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
#   version         = "~> 5.2.2"
#   organization_id = var.org_id
#   # folder_id       = local.folder_id
#   policy_for        = "organization"
#   policy_type       = "list"
#   allow             = var.storage_retention_policy_seconds
#   allow_list_length = length(var.storage_retention_policy_seconds)
#   constraint        = "constraints/storage.retentionPolicySeconds"
#   #   exclude_projects = []
# }

// IFPUCGCP-416
module "uniform_Bucket_Level_Access" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  #   folder_id        = local.folder_id
  policy_for  = "organization"
  policy_type = "boolean"
  enforce     = "true"
  constraint  = "constraints/storage.uniformBucketLevelAccess"
  #   exclude_projects = []
}


// IFPUCGCP-419
module "disable_Audit_Logging_Exemption" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  #   folder_id        = local.folder_id
  policy_for  = "organization"
  policy_type = "boolean"
  enforce     = "true"
  constraint  = "constraints/iam.disableAuditLoggingExemption"
  #   exclude_projects = []
}

//IFPUCGCP-420	
module "disable_Service_Account_Key_Upload" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  #   folder_id        = local.folder_id
  policy_for  = "organization"
  policy_type = "boolean"
  enforce     = "true"
  constraint  = "constraints/iam.disableServiceAccountKeyUpload"
  #   exclude_projects = []
}


// pending decision 
module "disable_ServiceAccount_Key_Creation" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  policy_for      = "organization"
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/iam.disableServiceAccountKeyCreation"
  exclude_projects = [
    "prj-e-gcp-aquasec-72f7",      // Aquasec integration project
    "prj-e-gcp-anthos-pilot-e9ba", // Anthos Bare Metal pilot project
    "prj-c-gcp-service-now-a152",  // Temp for Service now key creation
  ]
}

### Compute Engine Service

//IFPUCGCP-421
module "disable_Guest_Attributes_Access" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  policy_for      = "organization"
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.disableGuestAttributesAccess"
  # exclude_projects = []
}

//IFPUCGCP-422
module "disable_Internet_NetworkEndpointGroups" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  policy_for      = "organization"
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.disableInternetNetworkEndpointGroup"
  # exclude_projects = []
}

//IFPUCGCP-423
module "disable_Nested_Virtualization" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  policy_for      = "organization"
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.disableNestedVirtualization"
  # exclude_projects = []
}

// IFPUCGCP-414
# module "restrict_Auth_Types" {
#   source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
#   version         = "~> 5.2.2"
#   organization_id = var.org_id
# # folder_id       = local.folder_id
#   policy_for      = "organization"
#   policy_type     = "list"
#   # enforce         = "false"
#   allow            = var.restrict_auth_types
#   allow_list_length = length(var.restrict_auth_types)
#   constraint      = "constraints/storage.restrictAuthTypes"
#   #   exclude_projects = []
# }

# // IFPUCGCP-424
module "disable_PrivateService_Connect_Creation_For_Consumers" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.PrivateService_Connect_Creation_Types
  allow_list_length = length(var.PrivateService_Connect_Creation_Types)
  constraint        = "constraints/compute.disablePrivateServiceConnectCreationForConsumers"
  #   exclude_projects = []
}

//IFPUCGCP-425
module "disable_SerialPort_Access" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  policy_for      = "organization"
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.disableSerialPortAccess"
  # exclude_projects = []
}

# //IFPUCGCP-426
module "disable_Ssh_In_Browser" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  policy_for      = "organization"
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.disableSshInBrowser"
  # exclude_projects = []
}

# //IFPUCGCP-427
module "require_Os_Login" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  policy_for      = "organization"
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.requireOsLogin"
  # exclude_projects = []
}

# //IFPUCGCP-437
module "skip_Default_Network_Creation" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  policy_for      = "organization"
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.skipDefaultNetworkCreation"
  # exclude_projects = []
}



// IFPUCGCP-417
module "resourcemanager_allowedExport_Destinations" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.allowed_export_destination
  allow_list_length = length(var.allowed_export_destination)
  constraint        = "constraints/resourcemanager.allowedExportDestinations"
  #   exclude_projects = []
}

// IFPUCGCP-418
module "resourcemanager_allowedImport_Sources" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.allowed_import_sources
  allow_list_length = length(var.allowed_import_sources)
  constraint        = "constraints/resourcemanager.allowedImportSources"
  #   exclude_projects = []
}

# # // IFPUCGCP-428
module "require_Vpc_Flow_Logs" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.Vpc_Flow_Logs_Sampling_Rate
  allow_list_length = length(var.Vpc_Flow_Logs_Sampling_Rate)
  constraint        = "constraints/compute.requireVpcFlowLogs"
  #   exclude_projects = []
}

# // IFPUCGCP-429
module "restrict_Cloud_NAT_Usage" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for  = "organization"
  policy_type = "list"
  enforce     = true
  # allow            = var.restrict_CloudNAT_subenets
  # allow_list_length = length(var.restrict_CloudNAT_subenets)
  constraint = "constraints/compute.restrictCloudNATUsage"
  #   exclude_projects = []
}

# // IFPUCGCP-430
module "restrict_Partner_dedicated_Interconnect_Usage" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.restrict_dedicated_interconnect_networks
  allow_list_length = length(var.restrict_dedicated_interconnect_networks)
  constraint        = "constraints/compute.restrictDedicatedInterconnectUsage"
  # exclude_folders = var.exclude_folders
}

# // IFPUCGCP-431
module "restrict_Partner_Interconnect_Usage" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.restrict_partner_interconnect_networks
  allow_list_length = length(var.restrict_partner_interconnect_networks)
  constraint        = "constraints/compute.restrictPartnerInterconnectUsage"
  #   exclude_projects = []
}

# // IFPUCGCP-432
module "restrict_Protocol_Forwarding_Creation_For" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.restrict_Protocol_Forwarding
  allow_list_length = length(var.restrict_Protocol_Forwarding)
  constraint        = "constraints/compute.restrictProtocolForwardingCreationForTypes"
  #   exclude_projects = []
}

# # // IFPUCGCP-433
module "restrict_Shared_Vpc_Backend_Services" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.restrict_Shared_Vpc_Backend_Services
  allow_list_length = length(var.restrict_Shared_Vpc_Backend_Services)
  constraint        = "constraints/compute.restrictSharedVpcBackendServices"
  #   exclude_projects = []
}

# // IFPUCGCP-434
module "restrict_Shared_Vpc_Host_Projects" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.restrict_Shared_Vpc_Host_Projects
  allow_list_length = length(var.restrict_Shared_Vpc_Host_Projects)
  constraint        = "constraints/compute.restrictSharedVpcHostProjects"
  #   exclude_projects = []
}

# // IFPUCGCP-435
module "restrict_Shared_Vpc_Subnetworks" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.Shared_Vpc_Subnetworks
  allow_list_length = length(var.Shared_Vpc_Subnetworks)
  constraint        = "constraints/compute.restrictSharedVpcSubnetworks"
  #   exclude_projects = []
}

// IFPUCGCP-436
module "restrict_Vpc_Peering" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.Vpc_Peering_Projects
  allow_list_length = length(var.Vpc_Peering_Projects)
  constraint        = "constraints/compute.restrictVpcPeering"
  #   exclude_projects = []
}



// IFPUCGCP-438
module "storage_Resource_Use_Restrictions" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = var.storage_Resource_Use_Restrictions
  allow_list_length = length(var.storage_Resource_Use_Restrictions)
  constraint        = "constraints/compute.storageResourceUseRestrictions"
  #   exclude_projects = []
}

// IFPUCGCP-439
module "vm_Can_Ip_Forward" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for  = "organization"
  policy_type = "list"
  enforce     = true
  # allow            = var.vm_Can_Ip_Forward
  # allow_list_length = length(var.vm_Can_Ip_Forward)
  constraint = "constraints/compute.vmCanIpForward"
  #   exclude_projects = []
}

// IFPUCGCP-440
module "vm_External_Ip_Access" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for  = "organization"
  policy_type = "list"
  enforce     = true
  # allow            = var.vm_External_Ip_Access
  # allow_list_length = length(var.vm_External_Ip_Access)
  constraint = "constraints/compute.vmExternalIpAccess"
  #   exclude_projects = []
}



# // OIDC
module "workloadIdentityPoolProviders" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for        = "organization"
  policy_type       = "list"
  allow             = ["prj-c-gcp-lob-wip-83cf"]
  allow_list_length = 1
  constraint        = "constraints/iam.workloadIdentityPoolProviders"
  # exclude_projects = []
}

// Restrict resource query visibility
module "resourcemanager_accessBoundaries" {
  source          = "localterraform.com/TD_PRIV_MOD_REG_ORG/plt-community-policy/google"
  version         = "~> 5.2.2"
  organization_id = var.org_id
  # folder_id       = local.folder_id
  policy_for  = "organization"
  policy_type = "list"
  # enforce         = "false"
  allow             = [
    "under:organizations/492080318473", // td.com
    "under:organizations/102589584140", // dev-td.com
  ]
  allow_list_length = 1
  constraint        = "constraints/resourcemanager.accessBoundaries"
  # exclude_projects = []
}
