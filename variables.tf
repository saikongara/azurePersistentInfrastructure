// Application Related Information
variable "ownerinfo" {
  description = "The service primcipal role assignment name"
}
variable "deployment_type" {
  description = "The service primcipal role assignment name"
}
variable "notification_dist_list" {
  description = "The service primcipal role assignment name"
}
variable "environment" {
  description = "The service primcipal role assignment name"
}



// Service Principle Object Id
variable "sp_object_id" {
  description = "Service Principal Object ID in Non prod Azure subscription"
}
variable "read_access_object_id" {
  description = "Read Access Object ID in Non prod Azure subscription"
}

//variable "state_storage_account_name" {
//  description = "Storage account to house .tfstate of persistent resources deployed using terraform scripts"
//}
//variable "state_resource_group_name" {
//  description = "Resource group to house .tfstate of persistent resources deployed using terraform scripts"
//}
//variable "state_storage_container_name" {
//  description = "Storage Container to house .tfstate of persistent resources deployed using terraform scripts"
//}
//variable "state_key" {
//  description = "State_key that houses .tfstate of persistent resources deployed using terraform scripts"
//}



// Resource Groups
variable "persistent_rg" {
  description = "Resource group to house Persistent resources deployed using terraform scripts"
}
variable "hive_metastore_rg" {
  description = "Resource group to house Hive Metastore resources deployed using terraform scripts"
}
variable "virtual_machine_rg" {
  description = "Resource group to house VM resources deployed using terraform scripts"
}
variable "location" {
  description = "Location to deploy resources"
}



// Key vault
variable "kv_name" {
  description = "Name of Key vault to house ude keys/secrets/certifictaes."
}
variable "kv_sku_name" {
  description = "Type of SKU for Key vault to house ude keys/secrets/certifictaes."
}
variable "kv_key_permissions" {
  description = "Key permissions for Key vault."
}
variable "kv_secret_permissions" {
  description = "Secret permissions for Key vault."
}
variable "network_acls_action" {
  description = "Action for Network ACL"
}
variable "network_acls_bypass" {
  description = "Bypass option for Network ACL"
}
// Key
variable "key_name" {
  description = "Name of Key from UDE Key vault"
}
variable "key_type" {
  description = "Type of Key from UDE Key vault"
}
variable "key_size" {
  description = "Size of Key from UDE Key vault"
}
variable "key_opts" {
  description = "Options for Key in UDE Key vault"
  type        = "list"
}



# Networking : Persistent
variable "persistent_vnet_name" {
  description = "The name of the virtual network."
}
variable "persistent_vnet_address_space" {
  description = "The address space that is used for the virtual network."
  type        = "list"
}
variable "persistent_subnet_name" {
  description = "The name of the subnet to create in the virtual network."
}
variable "persistent_address_prefix" {
  description = "The address prefix of the subnet."
}
variable "persistent_subnet_service_endpoints" {
  description = "The service endpoints that are used for subnet."
  type        = "list"
}
variable "network_ip_rules" {
  description = "The ip rules of network of the storage account."
  type        = "list"

  default = [
    "198.203.177.177",
    "198.203.175.175",
    "198.203.181.181",
    "168.183.84.12",
    "149.111.26.128",
    "149.111.28.128",
    "149.111.30.128",
    "220.227.15.70",
    "203.39.148.18",
    "161.249.192.14",
    "161.249.72.14",
    "161.249.80.14",
    "161.249.96.14",
    "161.249.144.14",
    "161.249.176.14",
    "161.249.16.0/23",
    "12.163.96.0/24",
  ]
}

// NSG
variable "persistent_nsg" {
  description = "The name of the virtual network."
}
variable "persistent_inbound_nsg_rule_1_name" {
  description = "The name of the inbound nsg rule."
}
variable "nsg_rule_1_name_source_address_prefix" {
  description = "The address prefix of the inbound nsg rule."
}
variable "persistent_inbound_nsg_rule_2_name" {
  description = "The name of the virtual network."
}
variable "nsg_rule_2_name_source_address_prefix" {
  description = "The address prefix of the inbound nsg rule."
}
variable "persistent_inbound_nsg_rule_3_name" {
  description = "The name of the virtual network."
}
variable "nsg_rule_3_name_source_address_prefix" {
  description = "The address prefix of the inbound nsg rule."
}
variable "persistent_outbound_nsg_rule" {
  description = "The name of the virtual network."
}
variable "persitent_nsg_application_name" {
  description = "The name of the virtual network."
}
variable "persitent_nsg_platform" {
  description = "The name of the virtual network."
}

// VIRTUAL MACHINE
variable "vm_vnet_name" {
  description = "The name of the VM virtual network."
}
variable "vm_vnet_address_space" {
  description = "The address space that is used for the VM virtual network."
  type        = "list"
}
variable "bastion_subnet_name" {
  description = "The name of the bastion subnet."
}
variable "bastion_address_prefix" {
  description = "The address prefix of the bastion subnet."
}
variable "vm_subnet_name" {
  description = "The name of the subnet to create in the VM virtual network."
}
variable "vm_address_prefix" {
  description = "The address prefix of the VM subnet."
}
// NETWORK SECURITY GROUP
variable "vm_nsg" {
  description = "The name of the NSG for VM virtual network."
}
variable "vm_nsg_rule_1_name" {
  description = "The name of the inbound nsg rule 01."
}
variable "vm_nsg_rule_2_name" {
  description = "The name of the inbound nsg rule 02."
}
variable "vm_nsg_rule_3_name" {
  description = "The name of the inbound nsg rule 03."
}
variable "vm_nsg_rule_3_source_address_prefix" {
  description = "The address prefix of the inbound nsg rule."
}
variable "vm_nsg_rule_3_destination_address_prefix" {
  description = "The address prefix of the inbound nsg rule."
}
variable "vm_nsg_rule_4_name" {
  description = "The name of the inbound nsg rule 04."
}
variable "vm_nsg_rule_4_destination_address_prefixes" {
  description = "The address prefixes of the inbound nsg rule."
  type        = "list"
}
// NETWORK INTERFACE
variable "vm_nic_name" {
  description = "The name of the VM Network Interface."
}
variable "vm_nic_config_name" {
  description = "The name of configuration of VM Network Interface"
}
variable "vm_private_ip_allocation" {
  description = "The type of allocation for Private IP of VM Network Interface"
}
// PUBLIC IP ADDRESS
variable "vm_public_ip_name" {
  description = "The name of Public IP of VM"
}
variable "vm_public_ip_allocation" {
  description = "The type of allocation for Public IP of VM"
}
variable "sku_type" {
  description = "The type of SKU for Public IP of VM"
}



// SQL Server : Hive Metastore
variable "sqlserver_name" {
  description = "The name of the virtual network."
}
variable "sqlserver_login" {
  description = "The name of the virtual network."
}
variable "sqlserver_pwd" {
  description = "The name of the virtual network."
}
variable "sqlserver_version" {
  description = "The name of the virtual network."
}
variable "sqlserver_firewall_rule_name" {
  description = "The name of the virtual network."
}
variable "sqlserver_firewall_startip" {
  description = "The name of the virtual network."
}
variable "sqlserver_firewall_endip" {
  description = "The name of the virtual network."
}
variable "sqlserver_ad_admin_login" {
  description = "The name of the virtual network."
}
variable "sqldb_name" {
  description = "The name of the virtual network."
}
variable "sqldb_edition" {
  description = "The name of the virtual network."
}
variable "sqldb_service_objective_name" {
  description = "The name of the virtual network."
}
variable "sqlserver_App_name" {
  description = "The name of the virtual network."
}
variable "sqlserver_platform" {
  description = "The name of the virtual network."
}



// Storage : Hive Metastore
variable "hive_storage_name" {
  description = "The name of the storage account."
}
variable "hive_storage_account_kind" {
  description = "The kind of the storage account."
}
variable "hive_storage_account_tier" {
  description = "The account tier of the storage account."
}
variable "hive_storage_account_replication_type" {
  description = "The replication type of the storage account."
}
variable "hive_storage_access_tier" {
  description = "The access tier of the storage account."
}
variable "hive_storage_account_encryption_source" {
  description = "The encryption source of the storage account."
}
variable "hive_storage_App_name" {
  description = "The environment tag of the storage account."
}
variable "hive_storage_platform" {
  description = "The environment tag of the storage account."
}



// SQL Server : Datawarehouse
variable "sqldwserver_name" {
  description = "The name of the virtual network."
}
variable "sqldwserver_login" {
  description = "The name of the virtual network."
}
variable "sqldwserver_pwd" {
  description = "The name of the virtual network."
}
variable "sqldwserver_version" {
  description = "The name of the virtual network."
}
//variable "ude_sqlserver_firewall_rule_name" {
//  description = "The name of the virtual network."
//}
//variable "ude_sqlserver_firewall_startip" {
//  description = "The name of the virtual network."
//}
//variable "ude_sqlserver_firewall_endip" {
//  description = "The name of the virtual network."
//}
variable "sqldwserver_ad_admin_login" {
  description = "The name of the virtual network."
}
variable "sqldwdb_name" {
  description = "The name of the virtual network."
}
variable "sqldwdb_edition" {
  description = "The name of the virtual network."
}
variable "sqldwdb_service_objective_name" {
  description = "The name of the virtual network."
}
variable "sqldwserver_App_name" {
  description = "The name of the virtual network."
}
variable "sqldwserver_platform" {
  description = "The name of the virtual network."
}



// Storage : SQL Datawarehouse
variable "sqldw_storage_name" {
  description = "The name of the storage account."
}
variable "sqldw_storage_account_kind" {
  description = "The kind of the storage account."
}
variable "sqldw_storage_account_tier" {
  description = "The account tier of the storage account."
}
variable "sqldw_storage_account_replication_type" {
  description = "The replication type of the storage account."
}
variable "sqldw_storage_access_tier" {
  description = "The access tier of the storage account."
}
variable "sqldw_storage_account_encryption_source" {
  description = "The encryption source of the storage account."
}
variable "sqldw_storage_App_name" {
  description = "The environment tag of the storage account."
}
variable "sqldw_storage_platform" {
  description = "The environment tag of the storage account."
}



// Storage : HDFS
variable "HDFS_storage_name" {
  description = "The environment tag of the storage account."
}
variable "HDFS_storage_account_kind" {
  description = "The environment tag of the storage account."
}
variable "HDFS_storage_account_tier" {
  description = "The environment tag of the storage account."
}
variable "HDFS_storage_account_replication_type" {
  description = "The environment tag of the storage account."
}
variable "HDFS_storage_access_tier" {
  description = "The environment tag of the storage account."
}
variable "HDFS_storage_account_encryption_source" {
  description = "The environment tag of the storage account."
}
variable "HDFS_storage_bypass" {
  description = "The environment tag of the storage account."
}
variable "HDFS_network_rule_default_action" {
  description = "The environment tag of the storage account."
}
variable "HDFS_storage_App_name" {
  description = "The environment tag of the storage account."
}
variable "HDFS_storage_platform" {
  description = "The environment tag of the storage account."
}
variable "nice_container_name" {
  description = "The HDFS container name of blob storage account."
}
variable "nice_container_access_type" {
  description = "The HDFS container access type of blob storage account."
}
variable "netezza_container_name" {
  description = "The HDFS container name of Netezza blob storage account."
}
variable "netezza_container_access_type" {
  description = "The HDFS container access type of Netezza blob storage account."
}



// Storage : Landing Zone
variable "landingzone_storage_name" {
  description = "The environment tag of the storage account."
}
variable "landingzone_storage_account_kind" {
  description = "The environment tag of the storage account."
}
variable "landingzone_storage_account_tier" {
  description = "The environment tag of the storage account."
}
variable "landingzone_storage_account_replication_type" {
  description = "The environment tag of the storage account."
}
variable "landingzone_storage_access_tier" {
  description = "The environment tag of the storage account."
}
variable "landingzone_storage_account_encryption_source" {
  description = "The environment tag of the storage account."
}
variable "landingzone_storage_bypass" {
  description = "The environment tag of the storage account."
}
variable "landingzone_network_rule_default_action" {
  description = "The environment tag of the storage account."
}
variable "landingzone_storage_App_name" {
  description = "The environment tag of the storage account."
}
variable "landingzone_storage_platform" {
  description = "The environment tag of the storage account."
}
variable "landingzone_container_name" {
  description = "The landing zone container name of blob storage account."
}
variable "landingzone_container_access_type" {
  description = "The landing zone container access type of blob storage account."
}



# Role Definition
variable "BlobDataContributor_role_definition_name" {
  description = "The service principal role assignment name"
}
variable "readaccess_role_definition_name" {
  description = "The read access role assignment name"
}
variable "persistent_managed_identity_name" {
  description = "The persistent Managed Identity name"
}



// Monitoring
variable "action_group" {
  description = "The service principal role assignment name"
}
variable "admin_email" {
  description = "The service principal role assignment name"
}
variable "devops_email" {
  description = "The service principal role assignment name"
}
variable "oncall_msg" {
  description = "The service principal role assignment name"
}



// Virtual Machine
variable "vm_name" {
  description = "UDE Virtual Machine Name."
}
variable "vm_size" {
  description = "UDE Virtual Machine Size."
}
variable "image_publisher" {
  description = "UDE Virtual Machine Image Publisher."
}
variable "image_offer" {
  description = "UDE Virtual Machine Image Offer."
}
variable "image_sku" {
  description = "UDE Virtual Machine Image SKU type."
}
variable "image_version" {
  description = "UDE Virtual Machine Image Version."
}
variable "disk_name" {
  description = "UDE Virtual Machine Disk name."
}
variable "disk_caching" {
  description = "UDE Virtual Machine Disk Caching."
}
variable "disk_create_option" {
  description = "UDE Virtual Machine Disk create option."
}
variable "disk_ostype" {
  description = "UDE Virtual Machine Disk OS type."
}
variable "disk_managed_disk_type" {
  description = "UDE Virtual Machine Disk managed type."
}
variable "profile_computer_name" {
  description = "UDE Virtual Machine Profile computer name."
}
variable "profile_admin_usr" {
  description = "UDE Virtual Machine profile admin name."
}
variable "profile_admin_pwd" {
  description = "UDE Virtual Machine profile admin password."
}
variable "profile_win_config_timezone" {
  description = "UDE Virtual Machine profile time Zone."
}
// Bastion
variable "vm_bastion_name" {
  description = "UDE Virtual Machine Bastion Name."
}
variable "vm_bastion_config" {
  description = "UDE Virtual Machine bastion Configuration."
}