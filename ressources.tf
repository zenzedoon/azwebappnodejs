
#########################
resource "azurerm_service_plan" "spwebapp" {
  location            = var.splocation
  name                = var.spname
  os_type             = var.spostype
  per_site_scaling_enabled     = var.spsitescaling
  resource_group_name = var.rgname
  sku_name            = var.spsku
  tags                         = var.tags
  worker_count                 = var.spworkercount
  zone_balancing_enabled       = var.spzonebalancing
}
########################

resource "azurerm_linux_web_app" "webapp" {
  app_settings                      =  var.azwebappkeys #{}
  client_affinity_enabled           = var.azwebappclientaffinity
  client_certificate_enabled        = var.azwebappclientcertificate
  client_certificate_mode           = var.azwebappclientcertificatemode
  enabled             = var.azwebappenabled
  https_only          = var.azwebapphttpsonly
  location            = var.splocation
  name                = var.azwebappname
  resource_group_name = var.rgname
  
  service_plan_id     = azurerm_service_plan.spwebapp.id
  tags                              = var.tags
  auth_settings {
          additional_login_parameters    = {}
          allowed_external_redirect_urls = []
          enabled                        = false 
          token_refresh_extension_hours  = 0
          token_store_enabled            = false 
  }

  site_config {
    always_on                                 = var.alwayson
    #auto_heal_enabled                        = false
    container_registry_use_managed_identity   = var.usemngdidntycontainerregistry
    default_documents                         = [
              "Default.htm",
              "Default.html",
              "Default.asp",
              "index.htm",
              "index.html",
              "iisstart.htm",
              "default.aspx",
              "index.php",
              "hostingstart.html",
            ] 
      ftps_state                              = var.ftpsstate
      health_check_eviction_time_in_min       = var.healthcheckenviction
      http2_enabled                           = var.http2enabled
      ip_restriction                          = [] 
      load_balancing_mode                     = var.loadbalancingmode
      local_mysql_enabled                     = var.localmysql
      managed_pipeline_mode                   = var.managedpipeline
      minimum_tls_version                     = var.tlsversion 
      remote_debugging_enabled                = false 
      remote_debugging_version                = "VS2019"
      scm_ip_restriction                      = []
      scm_minimum_tls_version                 = var.tlsversion 
      scm_use_main_ip_restriction             = false
      use_32_bit_worker                       = var.bitworker32
      vnet_route_all_enabled                  = false 
      websockets_enabled                      = false
      worker_count                            = 1 
      application_stack {
             node_version = var.nodeversion 
            }
  }
}



resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_linux_web_app.webapp.id
  branch             = var.githubbranch
  repo_url           = var.githubrepo
  rollback_enabled       = false
  # scm_type               = (known after apply)
 # use_local_git          = true
  use_manual_integration = false
  use_mercurial          = false
  # depends_on             = [azurerm_source_control_token.githubtoken]
}

##################### to be checked befor use :
# resource "azurerm_web_app" "example" {
#   name                = "example-webapp"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   app_service_plan_id = azurerm_app_service_plan.example.id
#   https_only = true
# }

# resource "azurerm_app_service_source_control" "example" {
#   resource_group_name = azurerm_resource_group.example.name
#   name                = azurerm_web_app.example.name
#   location            = azurerm_resource_group.example.location
#   app_service_name    = azurerm_web_app.example.name
#   repository_url      = "https://github.com/example/example-repo.git"
#   branch              = "main"
#   repository_type     = "GitHub"
#   git_token           = var.github_token
# }

# resource "azurerm_app_service_deployment_slot" "example" {
#   resource_group_name = azurerm_resource_group.example.name
#   name               = "example-slot"
#   location            = azurerm_resource_group.example.location
#   app_service_name    = azurerm_web_app.example.name
#   slot_name           = "staging"
# }

# resource "azurerm_app_service_deployment_user" "example" {
#   resource_group_name = azurerm_resource_group.example.name
#   name                = azurerm_web_app.example.name
#   location            = azurerm_resource_group.example.location
#   app_service_name    = azurerm_web_app.example.name
#   use_local_git       = true
# }

# variable "github_token" {
#   default = "YOUR_GITHUB_TOKEN"
# }
