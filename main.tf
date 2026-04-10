resource "azurerm_resource_group" "migrate_scope" {
  name     = "AICloudBuilder"
  location = "southindia"
  tags = {
    ManagedBy       = "MigrateOps"
    MigrateOpsImport = "true"
  }
}

resource "azurerm_container_registry" "spiritops" {
  name                     = "spiritops"
  resource_group_name      = azurerm_resource_group.migrate_scope.name
  location                 = "southindia"
  sku                      = "Basic"
  admin_enabled            = true
  public_network_access_enabled = true
  tags = {
    ManagedBy       = "MigrateOps"
    MigrateOpsImport = "true"
  }
}

resource "azurerm_log_analytics_workspace" "workspaceaicloudbuilder9db5" {
  name                = "workspaceaicloudbuilder9db5"
  resource_group_name = azurerm_resource_group.migrate_scope.name
  location            = "southindia"
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = {
    ManagedBy       = "MigrateOps"
    MigrateOpsImport = "true"
  }
}

resource "azurerm_dns_zone" "spiritops_in" {
  name                = "spiritops.in"
  resource_group_name = azurerm_resource_group.migrate_scope.name
  location            = "global"
  tags = {
    ManagedBy       = "MigrateOps"
    MigrateOpsImport = "true"
  }
}
