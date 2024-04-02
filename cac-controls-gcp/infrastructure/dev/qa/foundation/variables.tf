variable "org_id" {
  description = "The organization id for the associated services"
  type        = string
}

variable "org_name" {
  description = "GCP Organization Name"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}

variable "domains" {
  description = "The list of domains to allow users from in IAM. Used by Domain Restricted Sharing Organization Policy. Must include the Production domain of the organization you are deploying the foundation. To add other domains you must also grant access to these domains to the terraform service account used in the deploy."
  type        = list(string)
}

variable "parent_folder" {
  description = "Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step."
  type        = string
}

variable "enable_os_login_policy" {
  description = "Enable OS Login Organization Policy."
  type        = bool
  default     = false
}

variable "exclude_folders" {
  description = "Excluded folder for org policy"
  type        = list(string)
  default     = []
}

// IFPUCGCP-306
variable "allowed_resource_location" {
  description = "This list constraint defines location where resoruce will be created"
  type        = list(string)
  default     = ["in:us-east4-locations", "in:us-central1-locations"]
}

// IFPUCGCP-283	
variable "allowed_services" {
  description = "This constraint defines the set of Google Cloud resource services that can be used within an organization, folder, or project, such as compute.googleapis.com and storage.googleapis.com. By default, all Google Cloud resource services are allowed. For more information, see https://cloud.google.com/resource-manager/help/organization-policy/restricting-resources. "
  type        = list(string)
  default = [
    "adsdatahub.googleapis.com",
    "accessapproval.googleapis.com",
    "aiplatform.googleapis.com",
    "apigee.googleapis.com",
    "apigeeconnect.googleapis.com",
    "appengine.googleapis.com",
    "artifactregistry.googleapis.com",
    "assuredworkloads.googleapis.com",
    "automl.googleapis.com",
    "bigquery.googleapis.com",
    "bigquerydatatransfer.googleapis.com",
    "bigtable.googleapis.com",
    "binaryauthorization.googleapis.com",
    "cloudasset.googleapis.com",
    "cloudbuild.googleapis.com",
    "clouderrorreporting.googleapis.com",
    "cloudfunctions.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudprofiler.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudsearch.googleapis.com",
    "cloudtrace.googleapis.com",
    "composer.googleapis.com",
    "compute.googleapis.com",
    "connectgateway.googleapis.com",
    "container.googleapis.com",
    "containeranalysis.googleapis.com",
    "containerregistry.googleapis.com",
    "containerthreatdetection.googleapis.com",
    "datacatalog.googleapis.com",
    "dataflow.googleapis.com",
    "datafusion.googleapis.com",
    "dataproc.googleapis.com",
    "dialogflow.googleapis.com",
    "dlp.googleapis.com",
    "dns.googleapis.com",
    "documentai.googleapis.com",
    "file.googleapis.com",
    "gameservices.googleapis.com",
    "gkeconnect.googleapis.com",
    "gkehub.googleapis.com",
    "healthcare.googleapis.com",
    "iam.googleapis.com",
    "iaptunnel.googleapis.com",
    "language.googleapis.com",
    "lifesciences.googleapis.com",
    "logging.googleapis.com",
    "managedidentities.googleapis.com",
    "memcache.googleapis.com",
    "meshca.googleapis.com",
    "metastore.googleapis.com",
    "ml.googleapis.com",
    "monitoring.googleapis.com",
    "networkconnectivity.googleapis.com",
    "networkmanagement.googleapis.com",
    "networksecurity.googleapis.com",
    "networkservices.googleapis.com",
    "notebooks.googleapis.com",
    "opsconfigmonitoring.googleapis.com",
    "osconfig.googleapis.com",
    "oslogin.googleapis.com",
    "privateca.googleapis.com",
    "pubsub.googleapis.com",
    "pubsublite.googleapis.com",
    "recaptchaenterprise.googleapis.com",
    "recommender.googleapis.com",
    "redis.googleapis.com",
    "run.googleapis.com",
    "secretmanager.googleapis.com",
    "servicecontrol.googleapis.com",
    "servicedirectory.googleapis.com",
    "securitycenter.googleapis.com",
    "spanner.googleapis.com",
    "speech.googleapis.com",
    "sqladmin.googleapis.com",
    "storage.googleapis.com",
    "storagetransfer.googleapis.com",
    "sts.googleapis.com",
    "texttospeech.googleapis.com",
    "tpu.googleapis.com",
    "trafficdirector.googleapis.com",
    "transcoder.googleapis.com",
    "translate.googleapis.com",
    "videointelligence.googleapis.com",
    "vision.googleapis.com",
    "vpcaccess.googleapis.com",
    "contactcenterinsights.googleapis.com",
    "dataplex.googleapis.com",
    "eventarc.googleapis.com",
    "firebaserules.googleapis.com",
    "kmsinventory.googleapis.com",
    "meshconfig.googleapis.com",
    "speakerid.googleapis.com",
  ]
}

variable "allowed_contact_domains_suffix" {
  description = "This list constraint defines location where reosuce will be created"
  type        = list(string)
  default     = ["@dev-td.com", "@pat-td.com", "@td.com"]
}

variable "allowed_policy_member_domains_customerid" {
  description = "This list constraint defines one or more Cloud Identity or Google Workspace customer IDs whose principals can be added to IAM policies. By default, all user identities are allowed to be added to IAM policies. Only allowed values can be defined in this constraint, denied values are not supported. If this constraint is active, only principals that belong to the allowed customer IDs can be added to IAM policies."
  type        = list(string)
  default = [
    "C02k6gbf4", // pat-td.com customer id
    "C0147pk0i", // datadoghq.com customer id
    "C030fgx8u", //wiz.io customer id
  ]
}

variable "restrict_auth_types" {
  description = "The constraint defines the set of authentication types that would be restricted from accessing any storage resources under the organization in Cloud Storage. Supported values are USER_ACCOUNT_HMAC_SIGNED_REQUESTS and SERVICE_ACCOUNT_HMAC_SIGNED_REQUESTS. Use in:ALL_HMAC_SIGNED_REQUESTS to include both."
  type        = list(string)
  default     = ["in:ALL_HMAC_SIGNED_REQUESTS"]
}

variable "storage_retention_policy_seconds" {
  description = "This list constraint defines the set of durations for retention policies that can be set on Cloud Storage buckets. By default, if no organization policy is specified, a Cloud Storage bucket can have a retention policy of any duration. The list of allowed durations must be specified as a positive integer value greater than zero, representing the retention policy in seconds. Any insert, update, or patch operation on a bucket in the organization resource must have a retention policy duration that matches the constraint. Enforcement of this constraint is not retroactive. When a new organization policy is applied, the retention policy of existing buckets remains unchanged and valid."
  type        = list(string)
  default     = ["34187400"]
}

variable "allowed_export_destination" {
  description = "This list constraint defines the set of external Organizations to which resources can be moved, and denies all moves to all other Organizations. By default, resources cannot be moved between Organizations. If this constraint is applied to a resource, the resource can be moved only to Organizations that are explicitly allowed by this constraint. Moves within an Organization are not governed by this constraint. The move operation will still require the same IAM permissions as normal resource moves. Values specified in allow/deny lists must be in the form: under:organizations/ORGANIZATION_ID."
  type        = list(string)
  default     = ["under:organizations/492080318473"] //td.com org id 
}

variable "allowed_import_sources" {
  description = "This list constraint defines the set of external Organizations from which resources can be imported, and denies all moves from all other Organizations. By default, resources cannot be moved between Organizations. If this constraint is applied to a resource, imported resources directly under this resource must be explicitly allowed by this constraint. Moves within an Organization are not governed by this constraint. The move operation will still require the same IAM permissions as normal resource moves. Values specified in allow/deny lists must be in the form: under:organizations/ORGANIZATION_ID."
  type        = list(string)
  default     = ["under:organizations/492080318473"] //td.com org id 
}


## variable "vmExternal_Ip_Accesss" {
#   description = ""
#   type        = list(string)
#   default     = ["911595324361"]
## }


// Compute Engine Servicce

variable "PrivateService_Connect_Creation_Types" {
  description = "This list constraint defines the set of Private Service Connect endpoint types for which users cannot create forwarding rules. When this constraint is enforced, users will be blocked from creating forwarding rules for the Private Service Connect endpoint type. This constraint is not retroactively enforced. By default, forwarding rules can be created for any Private Service Connect endpoint type. The allowed/denied list of Private Service Connect endpoints must come from the list below: [GOOGLE_APIS, SERVICE_PRODUCERS]. Using GOOGLE_APIS in the allowed/denied list will restrict the creation of Private Service Connect forwarding rules for accessing Google APIs. Using SERVICE_PRODUCERS in the allowed/denied list will restrict the creation of Private Service Connect forwarding rules for accessing services in another VPC network"
  type        = list(string)
  default     = ["GOOGLE_APIS", "SERVICE_PRODUCERS"]
}


variable "Vpc_Flow_Logs_Sampling_Rate" {
  description = "This list constraint defines the set of predefined policies that can be enforced for VPC Flow logs.By default VPC Flow logs may be configured with any settings in each subnet.This constraint enforces enabling flow logs for all subnetworks in scope with a required minimum sampling rate.Specify one or more of the following valid values:[ESSENTIAL (allows values >= 0.1 and < 0.5), LIGHT (allows values >= 0.5 and < 1.0), COMPREHENSIVE (allows values == 1.0)]."
  type        = list(string)
  default     = ["COMPREHENSIVE"]
}

# variable "restrict_CloudNAT_subenets" {
#   description = "This list constraint defines the set of subnetworks that are allowed to use Cloud NAT. By default, all subnetworks are allowed to use Cloud NAT. The allowed/denied list of subnetworks must be identified in the form: under:organizations/ORGANIZATION_ID, under:folders/FOLDER_ID, under:projects/PROJECT_ID, or projects/PROJECT_ID/regions/REGION_NAME/subnetworks/SUBNETWORK_NAME"
#   type        = list(string)
#   default     = []
# }

variable "restrict_dedicated_interconnect_networks" {
  description = "This list constraint defines the set of Compute Engine networks that are allowed to use Dedicated Interconnect. By default, networks are allowed to use any type of Interconnect. The allowed/denied list of networks must be identified in the form: under:organizations/ORGANIZATION_ID, under:folders/FOLDER_ID, under:projects/PROJECT_ID, or projects/PROJECT_ID/global/networks/NETWORK_NAME"
  type        = list(string)
  default     = ["under:projects/prj-n-gcp-svpc-restricted-9105"]
}

variable "restrict_partner_interconnect_networks" {
  description = "This list constraint defines the set of Compute Engine networks that are allowed to use Partner Interconnect. By default, networks are allowed to use any type of Interconnect. The allowed/denied list of networks must be identified in the form: under:organizations/ORGANIZATION_ID, under:folders/FOLDER_ID, under:projects/PROJECT_ID, or projects/PROJECT_ID/global/networks/NETWORK_NAME."
  type        = list(string)
  default     = ["under:projects/prj-n-gcp-svpc-restricted-9105"]
}

variable "restrict_Protocol_Forwarding" {
  description = "This list constraint defines the type of protocol forwarding rule objects with target instance that a user can create. When this constraint is enforced, new forwarding rule objects with target instance will be limited to internal and/or external IP addresses, based on the types specified. The types to be allowed or denied must be listed explicitly. By default, creation of both internal and external protocol forwarding rule objects with target instance are allowed. The list of allowed or denied values can only include values from the list below: [INTERNAL, EXTERNAL]."
  type        = list(string)
  default     = ["INTERNAL"]
}

variable "restrict_Shared_Vpc_Backend_Services" {
  description = "This list constraint defines the set of shared VPC Backend Services that eligible resources can use. This constraint does not apply to resources within the same project. By default, eligible resources can use any shared VPC Backend Services. The allowed/denied list of Backend Services must be specified in the form: under:organizations/ORGANIZATION_ID, under:folders/FOLDER_ID, under:projects/PROJECT_ID, projects/PROJECT_ID/regions/REGION/backendServices/BACKEND_SERVICE_NAME or projects/PROJECT_ID/global/backendServices/BACKEND_SERVICE_NAME. This constraint is not retroactive."
  type        = list(string)
  default     = ["under:organizations/492080318473"]
}

variable "restrict_Shared_Vpc_Host_Projects" {
  description = "This list constraint defines the set of Shared VPC host projects that projects at or below this resource can attach to. By default, a project can attach to any host project in the same organization, thereby becoming a service project. Projects, folders, and organizations in allowed/denied lists affect all objects underneath them in the resource hierarchy, and must be specified in the form: under:organizations/ORGANIZATION_ID, under:folders/FOLDER_ID, or projects/PROJECT_ID."
  type        = list(string)
  default     = ["under:projects/prj-n-gcp-svpc-restricted-9105", "under:projects/prj-n-svpc-restricted-91a0", "under:projects/prj-q-gcp-svpc-restricted-df7c"]
}

variable "Vpc_Peering_Projects" {
  description = "This list constraint defines the set of VPC networks that are allowed to be peered with the VPC networks belonging to this project, folder, or organization. By default, a Network Admin for one network can peer with any other network. The allowed/denied list of networks must be identified in the form: under:organizations/ORGANIZATION_ID, under:folders/FOLDER_ID, under:projects/PROJECT_ID, or projects/PROJECT_ID/global/networks/NETWORK_NAME."
  type        = list(string)
  default     = ["under:folders/391150242170", "under:projects/prj-n-gcp-svpc-restricted-9105", "under:projects/prj-n-svpc-restricted-91a0"]
}

variable "Shared_Vpc_Subnetworks" {
  description = "This list constraint defines the set of shared VPC subnetworks that eligible resources can use. This constraint does not apply to resources within the same project. By default, eligible resources can use any shared VPC subnetwork. The allowed/denied list of subnetworks must be specified in the form: under:organizations/ORGANIZATION_ID, under:folders/FOLDER_ID, under:projects/PROJECT_ID, or projects/PROJECT_ID/regions/REGION/subnetworks/SUBNETWORK-NAME."
  type        = list(string)
  default     = ["under:projects/prj-c-gcp-svpc-restricted-7f7e", "under:projects/prj-q-gcp-svpc-restricted-df7c"]
}

variable "storage_Resource_Use_Restrictions" {
  description = "This list constraint defines a set of projects that are allowed to use Compute Engine's storage resources. By default, anyone with appropriate Cloud IAM permissions can access Compute Engine resources. When using this constraint, users must have Cloud IAM permissions, and they must not be restricted by the constraint to access the resource. Projects, folders, and organizations specified in allowed or denied lists must be in the form: under:projects/PROJECT_ID, under:folders/FOLDER_ID, under:organizations/ORGANIZATION_ID"
  type        = list(string)
  default     = ["under:organizations/492080318473"]
}


# variable "vm_Can_Ip_Forward" {
#   description = "This list constraint defines the set of VM instances that can enable IP forwarding. By default, any VM can enable IP forwarding in any virtual network. VM instances must be specified in the form: under:organizations/ORGANIZATION_ID, under:folders/FOLDER_ID, under:projects/PROJECT_ID, or projects/PROJECT_ID/zones/ZONE/instances/INSTANCE-NAME. This constraint is not retroactive."
#   type        = list(string)
#   default     = []
# }

# variable "vm_External_Ip_Access" {
#   description = "This list constraint defines the set of Compute Engine VM instances that are allowed to use external IP addresses. By default, all VM instances are allowed to use external IP addresses. The allowed/denied list of VM instances must be identified by the VM instance name, in the form: projects/PROJECT_ID/zones/ZONE/instances/INSTANCE"
#   type        = list(string)
#   default     = []
# }

variable "exclude_projects" {
  description = "Excluded projects for org policy"
  type        = list(string)
  default     = []
}
