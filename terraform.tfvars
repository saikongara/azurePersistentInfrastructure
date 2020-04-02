// Application Related Information
ownerinfo = "Sai Kongara"
deployment_type = "Automation through Terraform & Jenkins"
notification_dist_list = "Kongara, Sai"
environment = "Data Engineering & Data Analytics"



sp_object_id = ""
read_access_object_id = ""

//state_storage_account_name = "udestatestoragetf"
//state_resource_group_name = "udestatergtf"
//state_storage_container_name = "udestatecontainertf"
//state_key = "persistent.terraform.tfstate"



// Resource Groups
persistent_rg = "persistent-rg"
hive_metastore_rg = "hivemetastore"
virtual_machine_rg = "virtual-machine-resources"
location = "centralus"



// Key Vault
kv_name = "keyvault-name"
kv_sku_name = "standard"
kv_key_permissions = ["create", "get", "delete", "list", "wrapkey", "unwrapkey", "get",]
kv_secret_permissions = ["get", "delete", "set",]
network_acls_action = "Allow"
network_acls_bypass = "AzureServices"
// Key
key_name = "key-name"
key_type = "RSA"
key_size = 2048
key_opts = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey",]



// Networking
persistent_vnet_name = "persistent-vnet"
persistent_vnet_address_space = ["10.0.0.0/16"]
persistent_subnet_name = "persistent-subnet"
persistent_subnet_service_endpoints = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.AzureActiveDirectory"]
persistent_address_prefix = "10.0.1.0/24"
// NSG
persistent_nsg = "persistent_nsg"
persistent_inbound_nsg_rule_1_name = "HDIservices"
nsg_rule_1_name_source_address_prefix = ["13.89.171.122","13.89.171.124"]
persistent_inbound_nsg_rule_2_name = "Azure-providedDNS"
nsg_rule_2_name_source_address_prefix = ["168.63.129.16"]
persistent_inbound_nsg_rule_3_name = "OptumIPs"
nsg_rule_3_name_source_address_prefix = ["",""]
persistent_outbound_nsg_rule = "outbound-rule"
persitent_nsg_application_name = "Network Security Group"
persitent_nsg_platform = "Networking"

// Virtual Machine
vm_vnet_name = "vm-network"
vm_vnet_address_space = ["10.1.0.0/18","10.2.0.0/18"]
bastion_subnet_name = "AzureBastionSubnet"
bastion_address_prefix = "10.1.0.0/24"
vm_subnet_name = "vm-internal"
vm_address_prefix = "10.1.1.0/24"
// NSG
vm_nsg = "vm-nsg"
vm_nsg_rule_1_name = "HTTP"
vm_nsg_rule_2_name = "HTTPS"
vm_nsg_rule_3_name = "vnetonly"
vm_nsg_rule_3_source_address_prefix = "VirtualNetwork"
vm_nsg_rule_3_destination_address_prefix = "VirtualNetwork"
vm_nsg_rule_4_name = "SecurityCenter_JIT_Rule"
vm_nsg_rule_4_destination_address_prefixes = ["10.1.0.4"]
// NIC
vm_nic_name = "vm-nic"
vm_nic_config_name = "testconfiguration1"
vm_private_ip_allocation = "Dynamic"
// Public IP
vm_public_ip_name = "vm-pip"
vm_public_ip_allocation = "Static"
sku_type = "Standard"



// SQL Server for Hive Metastore
sqlserver_name = "metastore-sql-server"
sqlserver_login = "metastore_admin"
sqlserver_pwd = "2020@apR4"
sqlserver_version = "12.0"
sqlserver_firewall_rule_name = "metastore-db-firewall-rule"
sqlserver_firewall_startip = "149.111.26.128"
sqlserver_firewall_endip = "203.39.148.18"
sqlserver_ad_admin_login = "sqladmin"
sqldb_name = "metastore-sql-db"
sqldb_edition = "GeneralPurpose"
sqldb_service_objective_name = "GP_Gen4_2"
sqlserver_App_name = "Metastore SQL Server"
sqlserver_platform = "Database"


// SQL Server backend Storage
hive_storage_name = "metastore-storage-acc"
hive_storage_account_kind = "StorageV2"
hive_storage_account_tier = "Standard"
hive_storage_account_replication_type = "RAGRS"
hive_storage_access_tier = "Hot"
hive_storage_account_encryption_source = "Microsoft.Storage"
hive_storage_App_name = "Hive Metastore Persistent Storage"
hive_storage_platform = "Storage"


// SQL Server for SQL Datawarehouse
sqldwserver_name = "dw-sql-server"
sqldwserver_login = "dw_admin"
sqldwserver_pwd = "2020@apR4"
sqldwserver_version = "12.0"
sqldwserver_ad_admin_login = "sqldwadmin"
sqldwdb_name = "sql-dw"
sqldwdb_edition = "DataWarehouse"
sqldwdb_service_objective_name = "DW100c"
sqldwserver_App_name = "SQL Datawarehouse Gen2"
sqldwserver_platform = "Data Warehouse"


// SQL datawarehouse Storage
sqldw_storage_name = "dw-storage-acc"
sqldw_storage_account_kind = "StorageV2"
sqldw_storage_account_tier = "Standard"
sqldw_storage_account_replication_type = "RAGRS"
sqldw_storage_access_tier = "Hot"
sqldw_storage_account_encryption_source = "Microsoft.Storage"
sqldw_storage_App_name = "SQL DW Persistent Storage"
sqldw_storage_platform = "Data Warehouse Storage"



// HDI Cluster backend Storage
HDFS_storage_name = "adls-storage-acc"
HDFS_storage_account_kind = "StorageV2"
HDFS_storage_account_tier = "Standard"
HDFS_storage_account_replication_type = "RAGRS"
HDFS_storage_access_tier = "Hot"
HDFS_storage_account_encryption_source = "Microsoft.Storage"
HDFS_storage_bypass = ["AzureServices"]
HDFS_network_rule_default_action = "Deny"
//HDFS_network_ip_rules = ["100.0.0.1"]
HDFS_storage_App_name = "HDFS Storage"
HDFS_storage_platform = "Storage"
first_container_name = "container-01"
first_container_access_type = "container"
second_container_name = "container-02"
second_container_access_type = "container"

//Azure Blob Storage : Landing Zone
landingzone_storage_name = "blob-landingzone-storage-acc"
landingzone_storage_account_kind = "StorageV2"
landingzone_storage_account_tier = "Standard"
landingzone_storage_account_replication_type = "RAGRS"
landingzone_storage_access_tier = "Hot"
landingzone_storage_account_encryption_source = "Microsoft.Storage"
landingzone_storage_bypass = ["AzureServices"]
landingzone_network_rule_default_action = "Deny"
landingzone_storage_App_name = "Landing Zone Storage"
landingzone_storage_platform = "Storage"
landingzone_container_name = "container-01"
landingzone_container_access_type = "container"



// Role Definition
BlobDataContributor_role_definition_name = "Storage Blob Data Contributor"
readaccess_role_definition_name = "Reader and Data Access"
persistent_managed_identity_name = "non-user-id"



// Monitoring
action_group = "action-group"
admin_email = "sai.kongara@gmail.com"
devops_email = "sai.kongara@gmail.com"
oncall_msg = "000-000-0000"



// Virtual Machine
vm_name = "vm-windows"
vm_size = "Standard_DS1_v2"
image_publisher = "MicrosoftWindowsServer"
image_offer = "WindowsServer"
image_sku = "2019-Datacenter"
image_version = "latest"
disk_name = "vm-disk"
disk_caching = "ReadWrite"
disk_create_option = "FromImage"
disk_ostype = "Windows"
disk_managed_disk_type = "Standard_LRS"
profile_computer_name = "Sai-Kongara-PC"
profile_admin_usr = "pcadmin"
profile_admin_pwd ="2020@apR4"
profile_win_config_timezone = "Central Standard Time"
// Bastion
vm_bastion_name = "vm-bastion"
vm_bastion_config = "bastion-configuration"
