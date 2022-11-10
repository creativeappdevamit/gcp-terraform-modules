variable "project_id" {
  description = "(Required) Project_id"
}

variable "function" {
  description = "(Required) This is the map for Name of the pub-sub queues and associated function name. Ex- {`test-topic`:`test-function`}"
  type        = map(any)
}

variable "region" {
  description = "(Optional) Location where to spinup cloud functions"
  default     = "europe-west2"
}

variable "description" {
  description = "(Optional) description of the cloud function"
  default     = "This is a cloud functions."
}

variable "runtime" {
  description = "(Optional) runtime to be used for cloud functions. Allowed : nodejs8, nodejs10, python37, go111, go113"
  default     = "python39"
}

variable "available_memory_mb" {
  description = "(Optional) Memory, available to the function. Allowed values are: 128MB, 256MB, 512MB, 1024MB, and 2048MB."
  default     = 256
}

variable "bucket_name" {
  description = "(Required) The GCS bucket containing the zip which contains the function."
}

variable "source_object" {
  description = "(Required) The source archive object (file) in bucket."
}

variable "timeout" {
  description = "(Optional) Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds."
  default     = 60
}

variable "entry_point" {
  description = "(Required) Name of the function that will be executed when the Google Cloud Function is triggered."
}

variable "labels" {
  description = "(Optional) A set of key/value label pairs to assign to the function"
  default     = {}
}

variable "max_instances" {
  description = "(Optional) The limit on the maximum number of function instances that may coexist at a given time."
  default     = 2000
}

variable "environment_variables" {
  description = "(Optional) The key-value pair to be included as a part of the cloud functions runtime variables"
  default     = {}
}
