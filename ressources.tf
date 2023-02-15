########################################################
## GithubToken used for the connexion to Github repo ###
resource "azurerm_source_control_token" "githubtoken" {
  type  = "GitHub"
  token =  var.githubtokenvalue# To be Defined 
}
######## local variable for the full fqdn domain name ##
locals {
  webappdomain = "${var.app_cnamevalue}.${var.app_domainevalue}"
}

######### Service plan for the azure web app ############
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

################ Linux Azure web app ##################
resource "azurerm_linux_web_app" "webapp" {
  app_settings            = {
          "AzureWebJobs.LetEncrypt.Enabled" = var.azwebappkeys["Letsencyptenabled"]
  }
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

##### create and configure source control for the azure webapp ####
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id                 = azurerm_linux_web_app.webapp.id
  branch                 = var.githubbranch
  repo_url               = var.githubrepo
  rollback_enabled       = false
  use_manual_integration = false
  use_mercurial          = false
  depends_on            = [azurerm_source_control_token.githubtoken]
}

### create a cname record for the custom domain for the azure webapp ###
resource "azurerm_dns_cname_record" "cnamewebapp" {
  name                = var.app_cnamevalue
  resource_group_name = var.rg_dnszone
  zone_name           = var.app_domainevalue
  ttl                 = 300
  record =  azurerm_linux_web_app.webapp.default_hostname
}

## create a TXT record for the verification of the ownership of domaine ##
resource "azurerm_dns_txt_record" "txtrecord" {
  name                = "asuid.www"
  resource_group_name = var.rg_dnszone
  zone_name           = var.app_domainevalue
  ttl                 = 300
  record {
    value =azurerm_linux_web_app.webapp.custom_domain_verification_id 
  }
}

####### Create a custom hostname binding for the azure web app ######### 
resource "azurerm_app_service_custom_hostname_binding" "custombinding" {
  hostname            = join(".", [azurerm_dns_cname_record.cnamewebapp.name, azurerm_dns_cname_record.cnamewebapp.zone_name])
  app_service_name    =  azurerm_linux_web_app.webapp.name
  resource_group_name = var.rgname
}

########## create a managed certificate for the azure web app ##########
resource "azurerm_app_service_managed_certificate" "managedcert" {
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.custombinding.id
}

########## create a certificate Binding for the azure web app ##########
resource "azurerm_app_service_certificate_binding" "certbinding" {
  hostname_binding_id = azurerm_app_service_custom_hostname_binding.custombinding.id
  certificate_id      = azurerm_app_service_managed_certificate.managedcert.id
  ssl_state           = "SniEnabled"
}