data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_key_vault_secret" "db-pwd" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = "${data.azurerm_key_vault.keyvault.id}"
  tags      = {
      "tag1": "tag_value_1"
      "tag2": "tag_value_2"
 }
}

output "kvid" {
  value = "${data.azurerm_key_vault.keyvault.id}"
}
