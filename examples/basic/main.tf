terraform {
  required_version = ">= 1.7.0"
}

module "network-azurefirewall" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  firewall_policies = {} # see README Inputs table / upstream module docs for the per-entry schema
  firewalls         = {} # see README Inputs table / upstream module docs for the per-entry schema
}
