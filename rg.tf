locals {
  tags = {
    Application_Owner            = "${var.ownerinfo}"
    Deployment_Type              = "${var.deployment_type}"
    Notification_Dist_List       = "${var.notification_dist_list}"
    Environment                  = "${var.environment}"
  }
}

# RESOURCE GROUPS

// Persistent Resources
resource "azurerm_resource_group" "resources-rg-persistent" {
  name     = "${var.persistent_rg}"
  location = "${var.location}"
}

// Metastore Resources
resource "azurerm_resource_group" "resources-rg-hive-metastore" {
  name     = "${var.hive_metastore_rg}"
  location = "${var.location}"
}

// Virtual Machine
resource "azurerm_resource_group" "resources-rg-vm" {
  name     = "${var.virtual_machine_rg}"
  location = "${var.location}"
}