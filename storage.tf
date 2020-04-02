# Storage Account : Landing Zone
resource "azurerm_storage_account" "resource-blob-storage-landingzone" {
  name                      = "${var.landingzone_storage_name}"
  resource_group_name       = "${azurerm_resource_group.resources-rg-persistent.name}"

  location                  = "${azurerm_resource_group.resources-rg-persistent.location}"
  account_kind              = "${var.landingzone_storage_account_kind}"
  account_tier              = "${var.landingzone_storage_account_tier}"
  enable_https_traffic_only = true
  account_replication_type  = "${var.landingzone_storage_account_replication_type}"
  access_tier               = "${var.landingzone_storage_access_tier}"
  account_encryption_source = "${var.landingzone_storage_account_encryption_source}"

  network_rules {
    bypass                     = "${var.landingzone_storage_bypass}"
    default_action             = "${var.landingzone_network_rule_default_action}"
    ip_rules                   = "${var.network_ip_rules}"
    virtual_network_subnet_ids = ["${azurerm_subnet.resource-subnet-persistent.id}"]
  }

  tags = {
    Application_name = "${var.landingzone_storage_App_name}"
    platform = "${var.landingzone_storage_platform}"
  }
//  tags                         = "${local.tags}"
}

# Storage Container : Landing Zone
resource "azurerm_storage_container" "resource-blob-container-landingzone" {
  name                  = "${var.landingzone_container_name}"
  storage_account_name  = "${azurerm_storage_account.resource-blob-storage-landingzone.name}"
  container_access_type = "${var.landingzone_container_access_type}"
}


# Storage Account : HDFS
resource "azurerm_storage_account" "resource-adls-storage" {
  name                      = "${var.HDFS_storage_name}"
  resource_group_name       = "${azurerm_resource_group.resources-rg-persistent.name}"

  location                  = "${azurerm_resource_group.resources-rg-persistent.location}"
  account_kind              = "${var.HDFS_storage_account_kind}"
  account_tier              = "${var.HDFS_storage_account_tier}"
  enable_https_traffic_only = true
  is_hns_enabled            = true
  account_replication_type  = "${var.HDFS_storage_account_replication_type}"
  access_tier               = "${var.HDFS_storage_access_tier}"
  account_encryption_source = "${var.HDFS_storage_account_encryption_source}"

  network_rules {
    bypass                     = "${var.HDFS_storage_bypass}"
    default_action             = "${var.HDFS_network_rule_default_action}"
    ip_rules                   = "${var.network_ip_rules}"
    virtual_network_subnet_ids = ["${azurerm_subnet.resource-subnet-persistent.id}"]
  }

  tags = {
    Application_name = "${var.HDFS_storage_App_name}"
    Environment = "${var.HDFS_storage_platform}"
  }
//  tags                         = "${local.tags}"
}

# Storage Container : HDFS Storage
resource "azurerm_storage_container" "resource-adls-container-01" {
  name                  = "${var.nice_container_name}"
  //  resource_group_name   = "${azurerm_resource_group.resources-rg-persistent.name}"
  storage_account_name  = "${azurerm_storage_account.resource-adls-storage.name}"
  container_access_type = "${var.nice_container_access_type}"
}
resource "azurerm_storage_container" "resource-adls-container-02" {
  name                  = "${var.netezza_container_name}"
  //  resource_group_name   = "${azurerm_resource_group.resources-rg-persistent.name}"
  storage_account_name  = "${azurerm_storage_account.resource-adls-storage.name}"
  container_access_type = "${var.netezza_container_access_type}"
}


# Storage Account : SQL Server
resource "azurerm_storage_account" "resource-metastore-storage" {
  name                      = "${var.hive_storage_name}"
  resource_group_name       = "${azurerm_resource_group.resources-rg-hive-metastore.name}"

  location                  = "${azurerm_resource_group.resources-rg-hive-metastore.location}"
  account_kind              = "${var.hive_storage_account_kind}"
  account_tier              = "${var.hive_storage_account_tier}"
  enable_https_traffic_only = true
  account_replication_type  = "${var.hive_storage_account_replication_type}"
  access_tier               = "${var.hive_storage_access_tier}"
  account_encryption_source = "${var.hive_storage_account_encryption_source}"

  tags = {
    Application_name = "${var.hive_storage_App_name}"
    Environment = "${var.hive_storage_platform}"
  }
//  tags                         = "${local.tags}"
}


# Storage Account : SQL Datawarehouse
resource "azurerm_storage_account" "resource-dw-storage" {
  name                      = "${var.sqldw_storage_name}"
  resource_group_name       = "${azurerm_resource_group.resources-rg-persistent.name}"

  location                  = "${azurerm_resource_group.resources-rg-persistent.location}"
  account_kind              = "${var.sqldw_storage_account_kind}"
  account_tier              = "${var.sqldw_storage_account_tier}"
  enable_https_traffic_only = true
  account_replication_type  = "${var.sqldw_storage_account_replication_type}"
  access_tier               = "${var.sqldw_storage_access_tier}"
  account_encryption_source = "${var.sqldw_storage_account_encryption_source}"

  tags = {
    Application_name = "${var.sqldw_storage_App_name}"
    Environment = "${var.sqldw_storage_platform}"
  }
}