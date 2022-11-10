variable proxy_credentials {
  description = "(Required) Generated credentials for the cloud sql service account"
}


variable project_id {
  description = "(Optional) The project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable region {
  description = "(Optional) default region"
  default = "europe-west2"
}

variable instance_name {
  description = "Name of manages SQL instance."
}

variable reporting_name {
  description = "Name of reporting SQL instance."
}

variable replica_name {
  description = "Name of replica SQL instance."
  default = null
}