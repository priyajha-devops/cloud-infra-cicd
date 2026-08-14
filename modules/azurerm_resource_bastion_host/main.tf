resource "azurerm_bastion_host" "example" {
    for_each = var.var_host
  name                = each.value.name
  location            = each.value.location 
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_name
    subnet_id            = each.value.subnet_id 
    public_ip_address_id = each.value.public_ip_address_id
  }
}