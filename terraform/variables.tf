variable "trusted_ips" {
  description = "Trusted IP ranges for Security Group/IAM access"
  type        = list(string)
  default     = ["192.0.2.0/24", "203.0.113.0/24"]
}
