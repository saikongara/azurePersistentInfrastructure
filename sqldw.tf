//data "azurerm_client_config" "current" {}


# SQL Server
resource "azurerm_sql_server" "resources-sqlserver-dw" {
  name                         = "${var.sqldwserver_name}"
  resource_group_name          = "${azurerm_resource_group.resources-rg-persistent.name}"
  location                     = "${azurerm_resource_group.resources-rg-persistent.location}"
  version                      = "${var.sqldwserver_version}"
  administrator_login          = "${var.sqldwserver_login}"
  administrator_login_password = "${var.sqldwserver_pwd}"
  //  tags                         = "${local.tags}"

  tags = {
    Application_name = "${var.sqldwserver_App_name}"
    platform = "${var.sqldwserver_platform}"
  }

  identity {
    type         = "SystemAssigned"
  }
}

resource "null_resource" "resources-dw-sqlserver-configuration" {
  # Advanced Data Security
  provisioner "local-exec" {
    command     = "Update-AzSqlServerAdvancedThreatProtectionSettings -ResourceGroupName ${azurerm_resource_group.resources-rg-persistent.name} -ServerName ${var.sqldwserver_name} -NotificationRecipientsEmails 'sai.kongara@optum.com;jeevan.paruchuri@optum.com' -EmailAdmins $True -StorageAccountName ${azurerm_storage_account.resource-dw-storage.name}"
    interpreter = ["pwsh", "-Command"]
  }

  # Vulnerability Scans
  provisioner "local-exec" {
    command     = "Update-AzSqlServerVulnerabilityAssessmentSetting -ResourceGroupName ${azurerm_resource_group.resources-rg-persistent.name} -ServerName ${var.sqldwserver_name} -StorageAccountName ${azurerm_storage_account.resource-dw-storage.name} -ScanResultsContainerName 'vulnerability-assessment' -RecurringScansInterval Weekly -NotificationEmail @('sai.kongara@optum.com' , 'jeevan.paruchuri@optum.com')"
    interpreter = ["pwsh", "-Command"]
  }

  # Auditing
  provisioner "local-exec" {
    command     = "Set-AzSqlServerAuditing -State Enabled -ResourceGroupName ${azurerm_resource_group.resources-rg-persistent.name} -ServerName ${var.sqldwserver_name} -StorageAccountName ${azurerm_storage_account.resource-dw-storage.name} -RetentionInDays 2"
    interpreter = ["pwsh", "-Command"]
  }
}


# Security : Firewall Rule (Embedding the SQL Datawarehouse (dw) into secure Firewall)
resource "azurerm_sql_firewall_rule" "resources-sqlserver-dw-firewallrule" {
  name                = "${azurerm_sql_firewall_rule.resources-metastore-sqlserver-firewallrule.name}"
  resource_group_name = "${azurerm_resource_group.resources-rg-persistent.name}"
  server_name         = "${azurerm_sql_server.resources-sqlserver-dw.name}"
  start_ip_address    = "${azurerm_sql_firewall_rule.resources-metastore-sqlserver-firewallrule.start_ip_address}"
  end_ip_address      = "${azurerm_sql_firewall_rule.resources-metastore-sqlserver-firewallrule.end_ip_address}"
}


# Configuring Service Principle as AD Admin for SQL Datawarehouse
resource "azurerm_sql_active_directory_administrator" "resources-sqlserver-dw-admin-config" {
  server_name         = "${azurerm_sql_server.resources-sqlserver-dw.name}"
  resource_group_name = "${azurerm_resource_group.resources-rg-persistent.name}"
  login               = "${var.sqldwserver_ad_admin_login}"
  tenant_id           = "${data.azurerm_client_config.current.tenant_id}"
  object_id           = "${data.azurerm_client_config.current.service_principal_object_id}"
}


# SQL Datawarehouse
resource "azurerm_sql_database" "resources-sql-dw" {
  name                                = "${var.sqldwdb_name}"
  resource_group_name                 = "${azurerm_resource_group.resources-rg-persistent.name}"
  server_name                         = "${azurerm_sql_server.resources-sqlserver-dw.name}"
  location                            = "${azurerm_resource_group.resources-rg-persistent.location}"
  edition                             = "${var.sqldwdb_edition}"
  requested_service_objective_name    = "${var.sqldwdb_service_objective_name}"

  create_mode = "Default"
  collation = "SQL_LATIN1_GENERAL_CP1_CI_AS"


  tags = {
    Application_name  = "${var.sqldwserver_App_name}"
    platform          = "${var.sqldwserver_platform}"
  }

}

resource "null_resource" "resources-dw-configuration" {
  provisioner "local-exec" {
    command     = "Update-AzSqlDatabaseAdvancedThreatProtectionSettings -ServerName ${var.sqldwserver_name} -ResourceGroupName ${azurerm_resource_group.resources-rg-persistent.name} -DatabaseName ${var.sqldwdb_name} -NotificationRecipientsEmails 'sai.kongara@optum.com;jeevan.paruchuri@optum.com' -StorageAccountName ${azurerm_storage_account.resource-dw-storage.name} -RetentionInDays 2 -EmailAdmins $True"
    interpreter = ["pwsh", "-Command"]
  }

  # Vulnerability Scans
  provisioner "local-exec" {
    command     = "Update-AzSqlDatabaseVulnerabilityAssessmentSetting -ResourceGroupName ${azurerm_resource_group.resources-rg-persistent.name} -ServerName ${var.sqldwserver_name} -DatabaseName ${var.sqldwdb_name} -StorageAccountName ${azurerm_storage_account.resource-dw-storage.name} -ScanResultsContainerName 'sqldw-vulnerability-assessment' -RecurringScansInterval Weekly -NotificationEmail ('sai.kongara@optum.com', 'jeevan.paruchuri@optum.com') -EmailAdmins $True"
    interpreter = ["pwsh", "-Command"]
  }

  # Auditing
  provisioner "local-exec" {
    command     = "Set-AzSqlDatabaseAudit -ResourceGroupName ${azurerm_resource_group.resources-rg-persistent.name} -ServerName ${var.sqldwserver_name} -DatabaseName ${var.sqldwdb_name} -RetentionInDays 2 -BlobStorageTargetState Enabled -StorageAccountResourceId ${azurerm_storage_account.resource-dw-storage.id}"
    interpreter = ["pwsh", "-Command"]
  }
}