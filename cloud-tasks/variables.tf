variable project_id {
    description = "Project_id"
}

variable name {
    description = "Name of the Cloud tasks queue"
}

variable region {
    description = "Location of the cloud tasks queue"
    default     = "europe-west2"
}

variable max_concurrent_dispatches {
    description = "max number of tasks in the queue that can execute at the same time"
    default     = 1000
}

variable max_dispatches_per_second {
    description = "How often the tasks in the queue is executed"
    default     = 10
}

variable max_attempts {
    description = "Max attempt of a task in the queue to be retried"
    default     = 10
}

variable min_backoff {
    description = "A task will be scheduled for retry between minBackoff and maxBackoff"
    default     = "600s"
}