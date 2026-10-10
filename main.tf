data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "firewall_policy" {
  source   = "Azure/avm-res-network-firewallpolicy/azurerm"
  version  = "0.3.4"
  for_each = var.firewall_policies

  name                                              = each.value.name
  location                                          = var.location
  resource_group_name                               = var.resource_group_name
  tags                                              = coalesce(each.value.tags, var.tags)
  enable_telemetry                                  = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  firewall_policy_dns                               = each.value.firewall_policy_dns
  firewall_policy_sql_redirect_allowed              = each.value.firewall_policy_sql_redirect_allowed
  firewall_policy_auto_learn_private_ranges_enabled = each.value.firewall_policy_auto_learn_private_ranges_enabled
  firewall_policy_explicit_proxy                    = each.value.firewall_policy_explicit_proxy
  firewall_policy_intrusion_detection               = each.value.firewall_policy_intrusion_detection
  firewall_policy_sku                               = each.value.firewall_policy_sku
  firewall_policy_threat_intelligence_allowlist     = each.value.firewall_policy_threat_intelligence_allowlist
  firewall_policy_tls_certificate                   = each.value.firewall_policy_tls_certificate
  lock                                              = each.value.lock
  role_assignments                                  = each.value.role_assignments
  firewall_policy_identity                          = each.value.firewall_policy_identity
  firewall_policy_insights                          = each.value.firewall_policy_insights
  firewall_policy_timeouts                          = each.value.firewall_policy_timeouts
  firewall_policy_private_ip_ranges                 = each.value.firewall_policy_private_ip_ranges
  firewall_policy_threat_intelligence_mode          = each.value.firewall_policy_threat_intelligence_mode
  diagnostic_settings                               = each.value.diagnostic_settings
  firewall_policy_base_policy_id                    = each.value.firewall_policy_base_policy_id
}

module "firewall" {
  source   = "Azure/avm-res-network-azurefirewall/azurerm"
  version  = "0.4.0"
  for_each = var.firewalls

  name                                 = each.value.name
  location                             = var.location
  resource_group_name                  = var.resource_group_name
  tags                                 = coalesce(each.value.tags, var.tags)
  enable_telemetry                     = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  diagnostic_settings                  = each.value.diagnostic_settings
  firewall_management_ip_configuration = each.value.firewall_management_ip_configuration
  firewall_private_ip_ranges           = each.value.firewall_private_ip_ranges
  firewall_zones                       = each.value.firewall_zones
  firewall_sku_name                    = each.value.firewall_sku_name
  firewall_sku_tier                    = each.value.firewall_sku_tier
  ip_configurations                    = each.value.ip_configurations
  lock                                 = each.value.lock
  role_assignments                     = each.value.role_assignments
  firewall_ip_configuration            = each.value.firewall_ip_configuration
  firewall_policy_id                   = each.value.firewall_policy_id
  firewall_timeouts                    = each.value.firewall_timeouts
  firewall_virtual_hub                 = each.value.firewall_virtual_hub
}
