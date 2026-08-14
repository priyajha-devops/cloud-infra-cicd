module "resource_group" {
  source      = "../../modules/azurerm_resource_group"
  rg_resource = var.var_rg
}
module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_resource_vnet"
  var_vnet   = var.var_vnet

}
module "subnet" {
  depends_on = [module.vnet]
  source     = "../../modules/azurerm_resource_subnet"
  subnet     = var.var_subnet
}
module "vnetpeering" {
  depends_on = [module.vnet]
  source     = "../../modules/azurerm_resource_vnet_peering"
  var_peer   = var.var_peering

}
module "nic" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_resource_NIC"
  var_nic    = var.var_niccard

}
module "nsg" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_resource_NSG"
  var_nsg    = var.var_nsgroup

}
module "publicip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_resource_publicIP"
  var_ip     = var.var_publicip

}
module "vm" {
  depends_on = [module.resource_group, module.nic, module.nsg, module.publicip]
  source     = "../../modules/azurerm_resource_Virtual_machine"
  var_vm     = var.var_virtualmachine


}
module "bastion" {
  source   = "../../modules/azurerm_resource_bastion_host"
  var_host = var.var_bastion

}