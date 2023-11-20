variable "name_prefix" {
  description = "A prefix to associate to all the module resources"
  default     = "zs"
}

variable "resource_tag" {
  description = "A tag to associate to all the module resources"
  default     = "cloud-connector"
}

variable "resource_group" {
  description = "Main Resource Group Name"
}

variable "subnet_id" {
  description = "Subnet ID for LB Frontend IP placement"
}
variable "zones" {
  type = list(string)
}

variable "http_probe_port" {
  type        = number
  description = "Port number for Cloud Connector cloud init to enable listener port for HTTP probe from Azure LB"
  default     = 50000
  validation {
    condition = (
      var.http_probe_port == 80 ||
      (var.http_probe_port >= 1024 && var.http_probe_port <= 65535)
    )
    error_message = "Input http_probe_port must be set to a single value of 80 or any number between 1024-65535."
  }
}

variable "location" {
  description = "Azure Region"
}

variable "load_distribution" {
  description = "Azure LB load distribution method"
  default     = "SourceIP"
}

variable "global_tags" {
  description = "populate custom user provided tags"
}