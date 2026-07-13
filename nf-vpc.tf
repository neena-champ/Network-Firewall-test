terraform {
  backend "s3" {}
}

module "network_firewall_spoke" {
  count                         = var.enable_dedicated_account ? 1 : 0
  source                        = "github.com/champ-oss/terraform-aws-network-spoke.git?ref=v1.0.5-f1894ed"
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
