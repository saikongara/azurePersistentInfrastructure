// VIRTUAL MACHINE - Windows
resource "azurerm_virtual_machine" "resource-vm-windows" {
  name                              = "${var.vm_name}"
  location                          = "${azurerm_resource_group.resources-rg-vm.location}"
  resource_group_name               = "${azurerm_resource_group.resources-rg-vm.name}"
  network_interface_ids             = [azurerm_network_interface.vmnic.id]
  delete_data_disks_on_termination  = true
  delete_os_disk_on_termination     = true
  vm_size                           = "${var.vm_size}"


  storage_image_reference {
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "${var.image_version}"
  }

  storage_os_disk {
    name              = "${var.disk_name}"
    caching           = "${var.disk_caching}"
    create_option     = "${var.disk_create_option}"
    os_type           = "${var.disk_ostype}"
    managed_disk_type = "${var.disk_managed_disk_type}"
  }

  os_profile {
    computer_name  = "${var.profile_computer_name}"
    admin_username = "${var.profile_admin_usr}"
    admin_password = "${var.profile_admin_pwd}"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = true
    provision_vm_agent        = true
    timezone                  = "${var.profile_win_config_timezone}"
  }

  tags = {
    environment = "Prod"
  }
}


// BASTION - Connectivity for VM through HTTPS
resource "azurerm_bastion_host" "resource-bastion" {
  name                = "${var.vm_bastion_name}"
  location            = "${azurerm_resource_group.resources-rg-vm.location}"
  resource_group_name = "${azurerm_resource_group.resources-rg-vm.name}"

  ip_configuration {
    name                 = "${var.vm_bastion_config}"
    subnet_id            = "${azurerm_subnet.resource-subnet-vm.id}"
    public_ip_address_id = "${azurerm_public_ip.resource-ip-vm.id}"
  }
}


// DISK ENCRYPTION - Virtual Machine - windows
resource "null_resource" "resource-vm-disk-encryption" {
  provisioner "local-exec" {
    command = "az vm encryption enable --resource-group ${azurerm_resource_group.resources-rg-vm.name} --name ${azurerm_virtual_machine.resource-vm-windows.name} --disk-encryption-keyvault ${azurerm_key_vault.resource-key-vault.id}"
  }
}



//// Managed Disk
//resource "azurerm_managed_disk" "resource-vm-disk" {
//  name                  = "${var.prefix}-mdisk"
//  location              = azurerm_resource_group.resources-rg-vm.location
//  resource_group_name   = azurerm_resource_group.resources-rg-vm.name
//  storage_account_type  = "Standard_LRS"
//  create_option         = "Empty"
//  disk_size_gb          = "50"
//}




//resource "azurerm_virtual_machine_extension" "allow-extension" {
//  name                 = "${var.prefix}-extensions"
//  virtual_machine_id   = azurerm_virtual_machine.resource-vm-windows.id
//  publisher            = "Microsoft.Azure.Extensions"
//  type                 = "CustomScript"
//  type_handler_version = "2.0"
//
//  settings = <<SETTINGS
//    {
//        "commandToExecute": "OSProfile.AllowExtensionOperations"
//    }
//SETTINGS
//}




//resource "null_resource" "resource-vm-disk-encryption" {
//  provisioner "local-exec" {
//    command = "Set-AzVMDiskEncryptionExtension -ResourceGroupName ${azurerm_resource_group.resources-rg-vm.name} -VMName ${azurerm_virtual_machine.resource-vm-windows.name} -DiskEncryptionKeyVaultUrl ${azurerm_key_vault.resource-key-vault.vault_uri} -DiskEncryptionKeyVaultId ${azurerm_key_vault.resource-key-vault.id}"
//    interpreter = ["pwsh", "-Command"]
//  }
//}
