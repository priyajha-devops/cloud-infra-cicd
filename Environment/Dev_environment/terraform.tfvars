var_rg = {
  rg1 = {
    name     = "resource_prod"
    location = "westeurope"
  }
  rg2 = {
    name     = "resource_dev"
    location = "centralindia"
  }
  rg3 = {
    name     = "resource_test"
    location = "centralindia"
  }
}

var_vnet = {
  vnet1 = {
    name                = "vnetwesteurope"
    location            = "westeurope"
    resource_group_name = "resource_prod"
    address_space       = ["10.50.0.0/16"]
  }
  vnet2 = {
    name                = "vnetcentralindia"
    location            = "centralindia"
    resource_group_name = "resource_dev"
    address_space       = ["10.60.0.0/16"]
  }
  vnet3 = {
    name                = "vnetbastion"
    location            = "westeurope"
    resource_group_name = "resource_prod"
    address_space       = ["10.80.0.0/25"]
  }
}

var_subnet = {
  subnet1 = {
    name                 = "subneteasteurope"
    resource_group_name  = "resource_prod"
    virtual_network_name = "vnetwesteurope"
    address_prefixes     = ["10.50.1.0/24"]
  }
  subnet2 = {
    name                 = "subnetcentralindia"
    resource_group_name  = "resource_dev"
    virtual_network_name = "vnetcentralindia"
    address_prefixes     = ["10.60.1.0/24"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "resource_prod"
    virtual_network_name = "vnetbastion"
    address_prefixes     = ["10.80.0.0/26"]
  }
}

var_peering = {
  peer1 = {
    name                         = "westeuropepeercentralindia"
    resource_group_name          = "resource_prod"
    virtual_network_name         = "vnetwesteurope"
    remote_virtual_network_id    = "/subscriptions/5b03e105-f606-436a-ab99-e33ae06a3230/resourceGroups/resource_dev/providers/Microsoft.Network/virtualNetworks/vnetcentralindia"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
  }
}
var_niccard = {
  nic1 = {
    name                          = "nic_westeurope"
    location                      = "westeurope"
    resource_group_name           = "resource_prod"
    name_subnet                   = "internal"
    subnet_id                     = "/subscriptions/5b03e105-f606-436a-ab99-e33ae06a3230/resourceGroups/resource_prod/providers/Microsoft.Network/virtualNetworks/vnetwesteurope/subnets/subneteasteurope"
    private_ip_address_allocation = "Dynamic"

  }
  nic2 = {
    name                          = "nic_centralindia"
    location                      = "centralindia"
    resource_group_name           = "resource_dev"
    name_subnet                   = "internal"
    subnet_id                     = "/subscriptions/5b03e105-f606-436a-ab99-e33ae06a3230/resourceGroups/resource_dev/providers/Microsoft.Network/virtualNetworks/vnetcentralindia/subnets/subnetcentralindia"
    private_ip_address_allocation = "Dynamic"

  }

}

var_nsgroup = {
  nsg1 = {
    name                = "SecurityGroup1"
    location            = "westeurope"
    resource_group_name = "resource_prod"
  }
  nsg2 = {
    name                = "SecurityGroup2"
    location            = "centralindia"
    resource_group_name = "resource_dev"
  }
}

var_publicip = {
  ip1 = {
    name                = "PublicIp1"
    resource_group_name = "resource_prod"
    location            = "westeurope"
    allocation_method   = "Static"
  }
  ip2 = {
    name                = "PublicIp1"
    resource_group_name = "resource_dev"
    location            = "centralindia"
    allocation_method   = "Static"

  }
}

var_virtualmachine = {
  vm1 = {
    name                  = "westeurope-vm"
    location              = "westeurope"
    resource_group_name   = "resource_prod"
    network_interface_ids = ["/subscriptions/5b03e105-f606-436a-ab99-e33ae06a3230/resourceGroups/resource_prod/providers/Microsoft.Network/networkInterfaces/nic_westeurope"]
    vm_size               = "Standard_D2s_v3"
    disk_nm               = "linux_disk"

  }
  vm2 = {
    name                  = "centralindia-vm"
    location              = "centralindia"
    resource_group_name   = "resource_dev"
    network_interface_ids = ["/subscriptions/5b03e105-f606-436a-ab99-e33ae06a3230/resourceGroups/resource_dev/providers/Microsoft.Network/networkInterfaces/nic_centralindia"]
    vm_size               = "Standard_D2s_v3"
    disk_nm               = "linux_disk"

  }
}
var_bastion = {
  host1 = {
    name                 = "bastion"
    location             = "westeurope"
    resource_group_name  = "resource_prod"
    ip_name              = "westeuropeconfiguration"
    subnet_id            = "/subscriptions/5b03e105-f606-436a-ab99-e33ae06a3230/resourceGroups/resource_prod/providers/Microsoft.Network/virtualNetworks/vnetbastion/subnets/AzureBastionSubnet"
    public_ip_address_id = "/subscriptions/5b03e105-f606-436a-ab99-e33ae06a3230/resourceGroups/resource_prod/providers/Microsoft.Network/publicIPAddresses/PublicIp1"
  }

}