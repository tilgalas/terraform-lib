variable "name" {
  type        = string
  description = "Network name"
}

variable "region" {
  type        = string
  description = "Region to create a subnet in"
}

variable "ip_cidr_range" {
  type        = string
  description = "IP CIDR range for the subnetwork"
}
