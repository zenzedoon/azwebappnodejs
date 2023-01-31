resource "azurerm_resource_group" "rgwebapp" {
  name     = "rg-webapp"
  location = "West Europe"
}
resource "azurerm_source_control_token" "githubtoken" {
  type  = "GitHub"
  token = "********************************" # To be Defined 
 }

module "azwebapptest01" {
  source  = "github.com/zenzedoon/azwebappnodejs"
  spname  = "spwebapp001"
  splocation = "West Europe"
  rgname  = azurerm_resource_group.rgwebapp.name
  azwebappname  = "azwebapptest01"
  githubtoken = azurerm_source_control_token.githubtoken.token
  githubrepo  = "https://github.com/zenzedoon/nodejs-docs-hello-world"
  
}
