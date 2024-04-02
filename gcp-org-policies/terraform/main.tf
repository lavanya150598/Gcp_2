# module "project_storage_1" {
#   source      = "git::ssh://git@github.com/telus/tf-module-gcp-storage?ref=v0.0.1"
#   project_id  =  var.project_id
#   bucket_name = "${var.project_id}-storage1"
# }

# below are additional terraform modules provided to teams for use as required:


# module "network" {
#   source     = "git::ssh://git@github.com/telus/tf-module-gcp-network?ref=v0.0.2"
#   name       = format("%s-%s",var.project_id, var.env)
#   project    = var.project_id

# }

# module "pubsub_topic_ingestion" {
#   source     = "git::ssh://git@github.com/telus/tf-module-gcp-pubsub?ref=v0.0.1"
#   project_id =  var.project_id
#   topic_name = "${var.project_id}-ingestion"
# }