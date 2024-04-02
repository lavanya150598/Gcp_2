# Resource Lifecycle Management Tags
variable "resource_lifecycle_tags" {
  type = map(object({
    tag = object({
      name = string
      desc = string
    })
    values = map(object({
      value = string
      desc  = string
    }))
  }))
}



module "resource_lifecycle_tags" {
  source                    = "../module/resource_tag"
  for_each                  = var.resource_lifecycle_tags
  scope                     = "organization"
  id                        = var.organization_id
  resource_lifecycle_tags   = each.value.tag
  resource_lifecycle_values = each.value.values
}