# This resource not only creates cloud functions but also 
# creates associated pub-sub topic.
resource "google_cloudfunctions_function" "pub-sub-function" {
  project               = var.project_id
  region                = var.region
  name                  = var.function.name
  description           = "${var.function.name}-${var.description}"
  runtime               = var.runtime

  event_trigger {
      event_type        = "google.pubsub.topic.publish"
      resource          = "projects/${var.project_id}/topics/${var.function.trigger}"
  }

  available_memory_mb   = var.available_memory_mb
  source_archive_bucket = var.bucket_name
  source_archive_object = var.source_object
  timeout               = var.timeout
  entry_point           = var.entry_point
  labels                = var.labels
  environment_variables = var.environment_variables
  max_instances         = var.max_instances
}