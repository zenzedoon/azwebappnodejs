## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_certificate_binding.certbinding](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_certificate_binding) | resource |
| [azurerm_app_service_custom_hostname_binding.custombinding](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_custom_hostname_binding) | resource |
| [azurerm_app_service_managed_certificate.managedcert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_managed_certificate) | resource |
| [azurerm_app_service_source_control.sourcecontrol](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_source_control) | resource |
| [azurerm_dns_cname_record.cnamewebapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_cname_record) | resource |
| [azurerm_dns_txt_record.txtrecord](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_txt_record) | resource |
| [azurerm_linux_web_app.webapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_service_plan.spwebapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_source_control_token.githubtoken](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/source_control_token) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alwayson"></a> [alwayson](#input\_alwayson) | should the app be loaded at all times ? | `bool` | `true` | no |
| <a name="input_app_cnamevalue"></a> [app\_cnamevalue](#input\_app\_cnamevalue) | the cname vaule for the web app | `string` | n/a | yes |
| <a name="input_app_domainevalue"></a> [app\_domainevalue](#input\_app\_domainevalue) | the custom domaine used for the web app | `string` | n/a | yes |
| <a name="input_azwebappclientaffinity"></a> [azwebappclientaffinity](#input\_azwebappclientaffinity) | Should the App Service send session affinity cookies, which route client requests in the same session to the same instance? | `bool` | `false` | no |
| <a name="input_azwebappclientcertificate"></a> [azwebappclientcertificate](#input\_azwebappclientcertificate) | Does the App Service require client certificates for incoming requests? | `bool` | `false` | no |
| <a name="input_azwebappclientcertificatemode"></a> [azwebappclientcertificatemode](#input\_azwebappclientcertificatemode) | Mode of client certificates for this App Service: required\|Optional\|OptionalInteractiveUser | `string` | `"Optional"` | no |
| <a name="input_azwebappenabled"></a> [azwebappenabled](#input\_azwebappenabled) | Does the App Service enabled? | `bool` | `true` | no |
| <a name="input_azwebapphttpsonly"></a> [azwebapphttpsonly](#input\_azwebapphttpsonly) | Does the App Service accessible only via HTTPS? | `bool` | `true` | no |
| <a name="input_azwebappkeys"></a> [azwebappkeys](#input\_azwebappkeys) | The key used with the azure web app settings | `map` | `{}` | no |
| <a name="input_azwebappname"></a> [azwebappname](#input\_azwebappname) | the name of the azure web app - must be unique | `string` | n/a | yes |
| <a name="input_bitworker32"></a> [bitworker32](#input\_bitworker32) | The worker process must be 32 bit | `bool` | `true` | no |
| <a name="input_ftpsstate"></a> [ftpsstate](#input\_ftpsstate) | State of FTP / FTPS service for this function app:AllAllowed\|FtpsOnly\|Disabled | `string` | `"Disabled"` | no |
| <a name="input_githubbranch"></a> [githubbranch](#input\_githubbranch) | The ghithub repository branch | `string` | `"main"` | no |
| <a name="input_githubrepo"></a> [githubrepo](#input\_githubrepo) | The ghithub repository url | `string` | n/a | yes |
| <a name="input_githubtokenvalue"></a> [githubtokenvalue](#input\_githubtokenvalue) | The github Token value | `string` | n/a | yes |
| <a name="input_healthcheckenviction"></a> [healthcheckenviction](#input\_healthcheckenviction) | he amount of time in minutes that a node can be unhealthy before being removed from the load balancer | `number` | `2` | no |
| <a name="input_http2enabled"></a> [http2enabled](#input\_http2enabled) | Specifies if the HTTP2 protocol should be enabled | `bool` | `false` | no |
| <a name="input_loadbalancingmode"></a> [loadbalancingmode](#input\_loadbalancingmode) | The Site load balancing mode: eightedRoundRobin\|LeastRequests\|LeastResponseTime\|WeightedTotalTraffic\|RequestHash\|PerSiteRoundRobin | `string` | `"LeastRequests"` | no |
| <a name="input_localmysql"></a> [localmysql](#input\_localmysql) | use of local mysqm | `bool` | `false` | no |
| <a name="input_managedpipeline"></a> [managedpipeline](#input\_managedpipeline) | Managed pipeline mode: Integrated\|Classic | `string` | `"Integrated"` | no |
| <a name="input_nodeversion"></a> [nodeversion](#input\_nodeversion) | The node version of web app: | `string` | `"18-lts"` | no |
| <a name="input_remotedebugging"></a> [remotedebugging](#input\_remotedebugging) | the minimum tls version | `string` | `"1.2"` | no |
| <a name="input_rg_dnszone"></a> [rg\_dnszone](#input\_rg\_dnszone) | the ressourse group of the domaine used for the web app | `string` | n/a | yes |
| <a name="input_rgname"></a> [rgname](#input\_rgname) | The resource group that host the azure web app | `string` | n/a | yes |
| <a name="input_splocation"></a> [splocation](#input\_splocation) | the location of the web app | `string` | `"West Europe"` | no |
| <a name="input_spname"></a> [spname](#input\_spname) | The azure service plan name used for the web app | `string` | n/a | yes |
| <a name="input_spostype"></a> [spostype](#input\_spostype) | The os type used for the web app | `string` | `"Linux"` | no |
| <a name="input_spsitescaling"></a> [spsitescaling](#input\_spsitescaling) | Check if the scaling is enabled per site | `bool` | `false` | no |
| <a name="input_spsku"></a> [spsku](#input\_spsku) | The sku used for the web app | `string` | `"B1"` | no |
| <a name="input_spworkercount"></a> [spworkercount](#input\_spworkercount) | The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU | `number` | `1` | no |
| <a name="input_spzonebalancing"></a> [spzonebalancing](#input\_spzonebalancing) | hould the Service Plan balance across Availability Zones in the region | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags of the azure web app | `map` | `{}` | no |
| <a name="input_tlsversion"></a> [tlsversion](#input\_tlsversion) | the minimum tls version | `string` | `"1.2"` | no |
| <a name="input_usemngdidntycontainerregistry"></a> [usemngdidntycontainerregistry](#input\_usemngdidntycontainerregistry) | use the managed identity of the container registry? | `bool` | `false` | no |

## Outputs

No outputs.
