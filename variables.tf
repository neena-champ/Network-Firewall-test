variable "enabled" {
  description = "Whether to enable the resources."
  type        = bool
  default     = true
}

variable "cidr_blocks" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule#cidr_blocks"
  default     = ["0.0.0.0/0"]
  type        = list(string)
}

variable "append_ingress_acl_rules" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl"
  type = list(object({
    cidr_block = string
    action     = optional(string, "allow")
  }))
  default = []
}


