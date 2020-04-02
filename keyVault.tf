// KEY VAULT - Disk Encryption Enabled
resource "azurerm_key_vault" "resource-key-vault" {
  name                        = "${var.kv_name}"
  location                    = "${azurerm_resource_group.resources-rg-vm.location}"
  resource_group_name         = "${azurerm_resource_group.resources-rg-vm.name}"
  enabled_for_disk_encryption = true
  //  enable_soft_delete          = true
  tenant_id                   = "${data.azurerm_client_config.current.tenant_id}"
  sku_name                    = "${var.kv_sku_name}"

  access_policy {
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"
    object_id = "${data.azurerm_client_config.current.service_principal_object_id}"

    key_permissions     = "${var.kv_key_permissions}"
    secret_permissions  = "${var.kv_secret_permissions}"
  }

  network_acls {
    default_action = "${var.network_acls_action}"
    bypass         = "${var.network_acls_bypass}"
  }
}

// KEY
resource "azurerm_key_vault_key" "resource-key" {
  name         = "${var.key_name}"
  key_vault_id = "${azurerm_key_vault.resource-key-vault.id}"
  key_type     = "${var.key_type}"
  key_size     = "${var.key_size}"

  key_opts  = "${var.key_opts}"
}

//resource "azurerm_disk_encryption_set" "udenpdes" {
//  name                = "${var.prefix}-np-des"
//  resource_group_name = azurerm_resource_group.resources-rg-vm.name
//  location            = azurerm_resource_group.resources-rg-vm.location
//  key_vault_key_id    = azurerm_key_vault_key.resource-key.id
//
////  identity {
////    type  = "SystemAssigned"
////  }
//
//}

