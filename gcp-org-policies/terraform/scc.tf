module "my_project" {
  source     = "git::ssh://git@github.com/koushikgurijala/tf-module-gcp-scc-metrics.git?ref=v0.3.0%2Btf.0.13.3"
  project_id = var.project_id
}
