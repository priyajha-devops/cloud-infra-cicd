resource "azurerm_resource_group" "resource" {
  for_each = var.rg_resource
  name     = each.value.name
  location = each.value.location
}