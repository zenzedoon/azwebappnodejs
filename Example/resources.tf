resource "azurerm_resource_group" "rgwebapp" {
  name     = "rg-webapp"
  location = "West Europe"
}

data "azurerm_resource_group" "rg-dns"{
  name    = "rg-dns"

}

data "azurerm_dns_zone" "customdomain"{
  name = "customdomain.tk"  
   resource_group_name = data.azurerm_resource_group.rg-dns.name
}

module "azwebapptest02" {
  source  = "github.com/zenzedoon/azwebappnodejs"
  spname  = "spwebapp001"
  splocation = "West Europe"
  rgname  = azurerm_resource_group.rgwebapp.name
  azwebappname  = "azwebapptest02"
  azwebappkeys = {
    "Letsencyptenabled" = true
  }
  githubrepo  = "https://github.com/zenzedoon/nodejs-docs-hello-world"
  githubtokenvalue ="TokenmustbegeneratedfrtomGitHub"
  app_domainevalue = data.azurerm_dns_zone.customdomain.name
  app_cnamevalue = "www"
  rg_dnszone = data.azurerm_resource_group.rg-dns.name
}