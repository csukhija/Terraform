resource "azurerm_resource_group" "rg" {
  name     = "akstekacr"
  location = "Central US"
}

resource "azurerm_container_registry" "acr" {
  name                     = "acrakstek"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = "Premium"
  admin_enabled            = false
  georeplication_locations = ["East US", "West Europe"]
}
