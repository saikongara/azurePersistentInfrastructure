// NETWORK SECURITY GROUP
resource "azurerm_network_security_group" "resource-nsg-persistent" {
  name                = "${var.persistent_nsg}"
  location            = "${azurerm_resource_group.resources-rg-persistent.location}"
  resource_group_name = "${azurerm_resource_group.resources-rg-persistent.name}"

  security_rule {
    name                       = "${var.persistent_inbound_nsg_rule_1_name}"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefixes    = "${var.nsg_rule_1_name_source_address_prefix}"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "${var.persistent_inbound_nsg_rule_2_name}"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "53"
    source_address_prefixes    = "${var.nsg_rule_2_name_source_address_prefix}"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "${var.persistent_inbound_nsg_rule_3_name}"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefixes    = "${var.nsg_rule_3_name_source_address_prefix}"
    destination_address_prefix = "*"
  }


  tags = {
    Application_name = "${var.persitent_nsg_application_name}"
    platform         = "${var.persitent_nsg_platform}"
  }
}

// VIRTUAL MACHINE - Windows
resource "azurerm_network_security_group" "resource-nsg-vm" {
  name                = "${var.vm_nsg}"
  location            = "${azurerm_resource_group.resources-rg-vm.location}"
  resource_group_name = "${azurerm_resource_group.resources-rg-vm.name}"


  security_rule {
    name                       = "${var.vm_nsg_rule_1_name}"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "${var.vm_nsg_rule_2_name}"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "${var.vm_nsg_rule_3_name}"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "${var.vm_nsg_rule_3_source_address_prefix}"
    destination_address_prefix = "${var.vm_nsg_rule_3_destination_address_prefix}"
  }

  security_rule {
    name                       = "${var.vm_nsg_rule_4_name}"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    //    destination_port_range     = "22,3389,5985,5986"
    destination_port_ranges     = ["22","3389","5985","5986"]
    source_address_prefix      = "*"
    destination_address_prefixes = "${var.vm_nsg_rule_4_destination_address_prefixes}"
  }
}

//resource "azurerm_network_security_rule" "resource-nsg-persistent-outbound" {
//  name                        = "${var.persistent_outbound_nsg_rule}"
//  priority                    = 100
//  direction                   = "Outbound"
//  access                      = "Deny"
//  protocol                    = "Tcp"
//  source_port_range           = "*"
//  destination_port_range      = "*"
//  source_address_prefix       = "*"
//  destination_address_prefix  = "*"
//  resource_group_name         = "${azurerm_resource_group.resources-rg-persistent.name}"
//  network_security_group_name = "${azurerm_network_security_group.resource-nsg-persistent.name}"
//}

// VIRTUAL NETWORK (SUBNET)
resource "azurerm_virtual_network" "resource-network-persistent" {
  name                = "${var.persistent_vnet_name}"
  address_space       = "${var.persistent_vnet_address_space}"
  location            = "${azurerm_resource_group.resources-rg-persistent.location}"
  resource_group_name = "${azurerm_resource_group.resources-rg-persistent.name}"
}
resource "azurerm_subnet" "resource-subnet-persistent" {
  name                 = "${var.persistent_subnet_name}"
  resource_group_name  = "${azurerm_resource_group.resources-rg-persistent.name}"
  virtual_network_name = "${azurerm_virtual_network.resource-network-persistent.name}"
  address_prefix       = "${var.persistent_address_prefix}"
  service_endpoints    = "${var.persistent_subnet_service_endpoints}"
}

// VIRTUAL MACHINE - VNet & Subnet
resource "azurerm_virtual_network" "resource-network-vm" {
  name                = "${var.vm_vnet_name}"
  address_space       = "${var.vm_vnet_address_space}"
  location            = "${azurerm_resource_group.resources-rg-vm.location}"
  resource_group_name = "${azurerm_resource_group.resources-rg-vm.name}"
}
resource "azurerm_subnet" "resource-subnet-vm" {
  name                 = "${var.bastion_subnet_name}"
  resource_group_name  = "${azurerm_resource_group.resources-rg-vm.name}"
  virtual_network_name = "${azurerm_virtual_network.resource-network-vm.name}"
  address_prefix       = "${var.bastion_address_prefix}"
  service_endpoints    = "${var.persistent_subnet_service_endpoints}"
}
resource "azurerm_subnet" "resource-subnet-vm-internal" {
  name                 = "${var.vm_subnet_name}"
  resource_group_name  = "${azurerm_resource_group.resources-rg-vm.name}"
  virtual_network_name = "${azurerm_virtual_network.resource-network-vm.name}"
  address_prefix       = "${var.vm_address_prefix}"
  service_endpoints    = "${var.persistent_subnet_service_endpoints}"
}



// VIRTUAL MACHINE - Network Interface
resource "azurerm_network_interface" "resource-nic-vm" {
  name                = "${var.vm_nic_name}"
  location            = "${azurerm_resource_group.resources-rg-vm.location}"
  resource_group_name = "${azurerm_resource_group.resources-rg-vm.name}"

  ip_configuration {
    name                          = "${var.vm_nic_config_name}"
    subnet_id                     = "${azurerm_subnet.resource-subnet-vm-internal.id}"
    private_ip_address_allocation = "${var.vm_private_ip_allocation}"
  }
}


// VIRTUAL MACHINE - Public IP Address
resource "azurerm_public_ip" "resource-ip-vm" {
  name                = "${var.vm_public_ip_name}"
  location            = "${azurerm_resource_group.resources-rg-vm.location}"
  resource_group_name = "${azurerm_resource_group.resources-rg-vm.name}"
  allocation_method   = "${var.vm_public_ip_allocation}"
  sku                 = "${var.sku_type}"
}



// VNET (SUBNET) - NSG ASSOCIATION
resource "azurerm_subnet_network_security_group_association" "resource-nsg-association-persistent" {
  subnet_id                 = "${azurerm_subnet.resource-subnet-persistent.id}"
  network_security_group_id = "${azurerm_network_security_group.resource-nsg-persistent.id}"
}

// VIRTUAL MACHINE - Windows
resource "azurerm_subnet_network_security_group_association" "resource-nsg-association-vm" {
  subnet_id                 = "${azurerm_subnet.resource-subnet-vm-internal.id}"
  network_security_group_id = "${azurerm_network_security_group.resource-nsg-vm.id}"
}