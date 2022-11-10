resource "google_cloudfunctions_function" "http-function" {
  project               = var.project_id
  region                = var.region
  name                  = var.function_name
  description           = "${var.function_name}-${var.description}"
  runtime               = var.runtime
  trigger_http          = true
  available_memory_mb   = var.available_memory_mb
  source_archive_bucket = var.bucket_name
  source_archive_object = var.source_object
  timeout               = var.timeout
  entry_point           = var.entry_point
  labels                = var.labels
  environment_variables = var.environment_variables
  max_instances         = var.max_instances
  ingress_settings      = var.ingress_settings
}