# Custom IAM Policy

The purpose of this section is to define Custom IAM constraints. Custom IAM contraints are intended for use with folder or org level oranizational policies to enforce a least privileged model.

## IAM Constraints

The following IAM constraints have been defined.

| Policy Name | Policy Constraint Name | Type | Roles |
|-------------|------------------------|------|-------|
| Primitive Roles Constraint | custom.iamPolicy.denyPrimativeRoles | DENY | roles/owner |
||||                                                                        roles/editor|
| Org Admin Roles Constraint | custom.iamPolicy.denyOrgAdminRoles | DENY | roles/assuredworkloads.admin|
||||                 roles/billing.admin|
||||                 roles/cloudasset.owner|
||||                 roles/iam.organizationRoleAdmin|
||||                 roles/resourcemanager.folderAdmin|
||||                 roles/resourcemanager.folderIamAdmin|
||||                 roles/resourcemanager.organizationAdmin|
||||                 roles/resourcemanager.projectCreator|
||||                 roles/resourcemanager.projectDeleter|
||||                 roles/resourcemanager.tagAdmin|
||||                 roles/orgpolicy.policyAdmin|
| BigQuery Admin Roles Constraint | custom.iamPolicy.denyBigQueryAdmin | DENY | roles/bigquery.resourceAdmin|
||||                                                                                 roles/bigquery.admin|