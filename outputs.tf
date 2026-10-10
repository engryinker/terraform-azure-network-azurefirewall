output "firewall_policies" {
  description = "Map (same keys as var.firewall_policies) of every output from each Firewall policies created -- see upstream module docs for the full shape."
  value       = module.firewall_policy
}

output "firewalls" {
  description = "Map (same keys as var.firewalls) of every output from each Azure Firewalls created -- see upstream module docs for the full shape."
  value       = module.firewall
}
