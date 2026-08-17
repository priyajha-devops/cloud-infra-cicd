resource "azurerm_network_interface" "example" {
  for_each            = var.var_nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name


  ip_configuration {
    name                          = each.value.name_subnet
    subnet_id                     = [data.azurerm_subnet.subnetdata[each.key].id]
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}
  data "azurerm_subnet" "subnetdata" {
    for_each = var.var_nic
  name = each.value.name_subnet
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
    
  }