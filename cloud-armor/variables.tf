variable "policy_name" {
  description = "(Required) The name of the security policy"
  type        = string
}
variable "project_id" {
  description = "(Optional) The project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}
variable "description" {
  description = "(Optional) An optional description of the security policy. Max size is 2048."
  default     = null
}
variable "ip_allow_list" {
  description = "(Required) Set of IP addresses or range (IPV4 or IPV6) in CIDR notation to match against inbound traffic"
}