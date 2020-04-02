//provider "azuread" {
//  version         = "~> 0.4"
//  subscription_id = "${var.subscription_id}"
//  tenant_id       = "${var.tenant_id}"
//  client_id       = "${var.sp_id}"
//  client_secret   = ""
//}


# Prod Subscription
provider "azurerm" {
//  version         = "~> 1.31"
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}