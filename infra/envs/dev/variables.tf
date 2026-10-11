# Day 6: only the variable providers.tf needs. Day 10 replaces this file with
# the full version (same path) that adds service_name, image_tag, desired_count.
variable "aws_region" {
  description = "AWS region to deploy into. Must match the region in backend.tf."
  type        = string
  default     = "eu-north-1"
}
