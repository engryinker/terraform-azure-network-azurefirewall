# terraform-azure-network-azurefirewall

Org-standard Terraform wrapper for: **Firewall policies, Azure Firewalls**.

This repo bundles 2 related upstream AVM modules into one wrapper, since they're normally deployed together.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/<org>/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/<org>/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "network-azurefirewall" {
  source = "git::https://github.com/<org>/terraform-azure-network-azurefirewall.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  firewall_policies = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }

  firewalls = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `firewall_policies` (Firewall policies)

Wraps [Azure/avm-res-network-firewallpolicy/azurerm](https://registry.terraform.io/modules/Azure/avm-res-network-firewallpolicy/azurerm/0.3.4) v0.3.4.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `firewall_policy_dns` | `any` | no |  |
| `firewall_policy_sql_redirect_allowed` | `bool` | no |  |
| `firewall_policy_auto_learn_private_ranges_enabled` | `bool` | no |  |
| `firewall_policy_explicit_proxy` | `any` | no |  |
| `firewall_policy_intrusion_detection` | `any` | no |  |
| `firewall_policy_sku` | `string` | no |  |
| `firewall_policy_threat_intelligence_allowlist` | `any` | no |  |
| `firewall_policy_tls_certificate` | `any` | no |  |
| `lock` | `any` | no |  |
| `role_assignments` | `any` | no |  |
| `firewall_policy_identity` | `any` | no |  |
| `firewall_policy_insights` | `any` | no |  |
| `firewall_policy_timeouts` | `any` | no |  |
| `firewall_policy_private_ip_ranges` | `list(string)` | no |  |
| `firewall_policy_threat_intelligence_mode` | `string` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `firewall_policy_base_policy_id` | `string` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

### `firewalls` (Azure Firewalls)

Wraps [Azure/avm-res-network-azurefirewall/azurerm](https://registry.terraform.io/modules/Azure/avm-res-network-azurefirewall/azurerm/0.4.0) v0.4.0.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `diagnostic_settings` | `any` | no |  |
| `firewall_management_ip_configuration` | `any` | no |  |
| `firewall_private_ip_ranges` | `set(string)` | no |  |
| `firewall_zones` | `set(string)` | no |  |
| `firewall_sku_name` | `string` | yes |  |
| `firewall_sku_tier` | `string` | yes |  |
| `ip_configurations` | `any` | no |  |
| `lock` | `any` | no |  |
| `role_assignments` | `any` | no |  |
| `firewall_ip_configuration` | `any` | no |  |
| `firewall_policy_id` | `string` | no |  |
| `firewall_timeouts` | `any` | no |  |
| `firewall_virtual_hub` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `firewall_policies` -- map (same keys as the input) of every output from each created Firewall policies.

- `firewalls` -- map (same keys as the input) of every output from each created Azure Firewalls.
