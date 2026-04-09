resource "azurerm_resource_group" "migrate_scope" {
  name     = "AICloudBuilder"
  location = "southindia"
}

resource "azurerm_container_app_environment" "spiritops_container_app_env" {
  name                = "spiritops-container-app-env"
  resource_group_name = azurerm_resource_group.migrate_scope.name
  location            = "southindia"

  log_analytics_workspace_id = "/subscriptions/be1b0fcb-1e30-4142-bb0c-ff52f7a1a0e5/resourceGroups/AICloudBuilder/providers/Microsoft.OperationalInsights/workspaces/workspaceaicloudbuilder9db5"
}

resource "azurerm_container_registry" "spiritops" {
  name                = "spiritops"
  resource_group_name = azurerm_resource_group.migrate_scope.name
  location            = "southindia"
  sku                 = "Basic"

  admin_enabled                 = true
  public_network_access_enabled = true
}

resource "azurerm_log_analytics_workspace" "workspaceaicloudbuilder9db5" {
  name                = "workspaceaicloudbuilder9db5"
  resource_group_name = azurerm_resource_group.migrate_scope.name
  location            = "southindia"

  sku              = "PerGB2018"
  retention_in_days = 30
}

resource "azurerm_dns_zone" "spiritops_in" {
  name                = "spiritops.in"
  resource_group_name = azurerm_resource_group.migrate_scope.name
}
