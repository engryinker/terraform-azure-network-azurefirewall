variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "firewall_policies" {
  description = "Map of Firewall policies to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-network-firewallpolicy/azurerm v0.3.4 (https://registry.terraform.io/modules/Azure/avm-res-network-firewallpolicy/azurerm/0.3.4) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                              = string
    tags                                              = optional(map(string))
    enable_telemetry                                  = optional(bool)
    firewall_policy_dns                               = optional(any, null)
    firewall_policy_sql_redirect_allowed              = optional(bool, null)
    firewall_policy_auto_learn_private_ranges_enabled = optional(bool, null)
    firewall_policy_explicit_proxy                    = optional(any, null)
    firewall_policy_intrusion_detection               = optional(any, null)
    firewall_policy_sku                               = optional(string, null)
    firewall_policy_threat_intelligence_allowlist     = optional(any, null)
    firewall_policy_tls_certificate                   = optional(any, null)
    lock                                              = optional(any, null)
    role_assignments                                  = optional(any, null)
    firewall_policy_identity                          = optional(any, null)
    firewall_policy_insights                          = optional(any, null)
    firewall_policy_timeouts                          = optional(any, null)
    firewall_policy_private_ip_ranges                 = optional(list(string), null)
    firewall_policy_threat_intelligence_mode          = optional(string, null)
    diagnostic_settings                               = optional(any, null)
    firewall_policy_base_policy_id                    = optional(string, null)
  }))
  default = {}
}

variable "firewalls" {
  description = "Map of Azure Firewalls to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-network-azurefirewall/azurerm v0.4.0 (https://registry.terraform.io/modules/Azure/avm-res-network-azurefirewall/azurerm/0.4.0) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                 = string
    tags                                 = optional(map(string))
    enable_telemetry                     = optional(bool)
    diagnostic_settings                  = optional(any, null)
    firewall_management_ip_configuration = optional(any, null)
    firewall_private_ip_ranges           = optional(set(string), null)
    firewall_zones                       = optional(set(string), null)
    firewall_sku_name                    = string
    firewall_sku_tier                    = string
    ip_configurations                    = optional(any, null)
    lock                                 = optional(any, null)
    role_assignments                     = optional(any, null)
    firewall_ip_configuration            = optional(any, null)
    firewall_policy_id                   = optional(string, null)
    firewall_timeouts                    = optional(any, null)
    firewall_virtual_hub                 = optional(any, null)
  }))
  default = {}
}
