data "azurerm_client_config" "current" {}


# SQL Server
resource "azurerm_sql_server" "resources-sqlserver-metastore" {
  name                         = "${var.sqlserver_name}"
  resource_group_name          = "${azurerm_resource_group.resources-rg-hive-metastore.name}"
  location                     = "${azurerm_resource_group.resources-rg-hive-metastore.location}"
  version                      = "${var.sqlserver_version}"
  administrator_login          = "${var.sqlserver_login}"
  administrator_login_password = "${var.sqlserver_pwd}"
//  tags                         = "${local.tags}"

  tags = {
    Application_name = "${var.sqlserver_App_name}"
    platform = "${var.sqlserver_platform}"
  }
}


resource "null_resource" "resources-metastore-sqlserver-configuration" {
  # Advanced Data Security
  provisioner "local-exec" {
    command     = "Update-AzSqlServerAdvancedThreatProtectionSettings -ResourceGroupName ${azurerm_resource_group.resources-rg-hive-metastore.name} -ServerName ${var.sqlserver_name} -NotificationRecipientsEmails 'sai.kongara@optum.com;jeevan.paruchuri@optum.com' -EmailAdmins $True -StorageAccountName ${azurerm_storage_account.resource-metastore-storage.name}"
    interpreter = ["pwsh", "-Command"]
  }

  # Vulnerability Scans
  provisioner "local-exec" {
    command     = "Update-AzSqlServerVulnerabilityAssessmentSetting -ResourceGroupName ${azurerm_resource_group.resources-rg-hive-metastore.name} -ServerName ${var.sqlserver_name} -StorageAccountName ${azurerm_storage_account.resource-metastore-storage.name} -ScanResultsContainerName 'vulnerability-assessment' -RecurringScansInterval Weekly -NotificationEmail @('sai.kongara@optum.com' , 'jeevan.paruchuri@optum.com')"
    interpreter = ["pwsh", "-Command"]
  }

  # Auditing
  provisioner "local-exec" {
    command     = "Set-AzSqlServerAuditing -State Enabled -ResourceGroupName ${azurerm_resource_group.resources-rg-hive-metastore.name} -ServerName ${var.sqlserver_name} -StorageAccountName ${azurerm_storage_account.resource-metastore-storage.name} -RetentionInDays 2"
    interpreter = ["pwsh", "-Command"]
  }
}


# Security : Firewall Rule (Embedding the SQL Server (db) into secure Firewall)
resource "azurerm_sql_firewall_rule" "resources-metastore-sqlserver-firewallrule" {
  name                = "${var.sqlserver_firewall_rule_name}"
  resource_group_name = "${azurerm_resource_group.resources-rg-hive-metastore.name}"
  server_name         = "${azurerm_sql_server.resources-sqlserver-metastore.name}"
  start_ip_address    = "${var.sqlserver_firewall_startip}"
  end_ip_address      = "${var.sqlserver_firewall_endip}"
}

# Configuring Service Principle as AD Admin for SQL Server
resource "azurerm_sql_active_directory_administrator" "resources-metastore-sqlserver-admin-config" {
  server_name         = "${azurerm_sql_server.resources-sqlserver-metastore.name}"
  resource_group_name = "${azurerm_resource_group.resources-rg-hive-metastore.name}"
  login               = "${var.sqlserver_ad_admin_login}"
  tenant_id           = "${data.azurerm_client_config.current.tenant_id}"
  object_id           = "${data.azurerm_client_config.current.service_principal_object_id}"
}


# SQL Database
resource "azurerm_sql_database" "resources-metastore-sql-db" {
  name                = "${var.sqldb_name}"
  resource_group_name = "${azurerm_resource_group.resources-rg-hive-metastore.name}"
  location            = "${azurerm_resource_group.resources-rg-hive-metastore.location}"
  server_name         = "${azurerm_sql_server.resources-sqlserver-metastore.name}"
  edition             = "${var.sqldb_edition}"
  requested_service_objective_name = "${var.sqldb_service_objective_name}"

//  tags                         = "${local.tags}"

  tags = {
    Application_name = "${var.sqlserver_App_name}"
    platform = "${var.sqlserver_platform}"
  }

}
