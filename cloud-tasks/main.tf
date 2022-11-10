resource "google_cloud_tasks_queue" "google-cloud-task" {
    project     = var.project_id
    name        = var.name
    location    = var.region
    rate_limits {
        max_concurrent_dispatches = var.max_concurrent_dispatches
        max_dispatches_per_second = var.max_dispatches_per_second
    }
    retry_config {
        max_attempts = var.max_attempts
        min_backoff  = var.min_backoff
    }
}