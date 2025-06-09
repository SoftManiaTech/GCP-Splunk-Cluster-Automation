variable "credentials_file" {
  description = "Path to GCP service account JSON key"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "subnetwork" {
  description = "GCP subnetwork name"
  type        = string
  default     = "default"
}

variable "ssh_user" {
  description = "Username for SSH login"
  type        = string
}

variable "ssh_public_key" {
  description = "Public SSH key to allow access"
  type        = string
}

variable "instances" {
  type = map(object({
    name              = string
    region            = string
    zone              = string
    instance_type     = string
    os_type           = string
    storage_size      = number
    elastic_ip_needed = bool
    security_group_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
}

variable "splunk_license_url" {
  description = "URL of Splunk license file"
  type        = string
}
