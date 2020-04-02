//data "azurerm_storage_account" "state_storage" {
//  name                = "${var.state_storage_account_name}"
//  resource_group_name = "${var.state_resource_group_name}"
//
//}

//terraform {
//  backend "azurerm" {
//    resource_group_name  = "${data.azurerm_storage_account.state_storage.resource_group_name}"
//    storage_account_name = "${data.azurerm_storage_account.state_storage.name}"
//    container_name       = "${data.azurerm_storage_account.state_storage.primary_blob_endpoint}${var.state_storage_container_name}"
//    key                  = "${var.state_key}"
//  }
//}

terraform {
  backend "azurerm" {
    resource_group_name  = "state-store-rg"
    storage_account_name = "state-storage-account"
    container_name       = "state-storage-container"
    key                  = "persistent.terraform.tfstate"
  }
}

//terraform {
//  backend "local" {}
//}