module "network_firewall_spoke" {
  source                        = "https://github.com/champ-oss/terraform-aws-network-spoke.git?ref=v1.0.6-343ad82"
  name                          = "network-firewall-vpc"
  transit_gateway_id            = "tgw-0d5a2d2413482e0f9"
  ingress_acl_rules             = local.ingress_acl_rules

  tags = merge(local.tags, var.tags,
    {
      cost_product   = "shared"
      cost_component = "network"
    }
  )
}
