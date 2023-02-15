variable "spname" {
  type        = string
  description = "The azure service plan name used for the web app"
}

variable "splocation"{
    type    = string
    description     = "the location of the web app"
    default         = "West Europe"
}
variable "spostype" {
  type        = string
  description = "The os type used for the web app"
  default     = "Linux"
}

variable "spsku" {
  type        = string
  description = "The sku used for the web app"
  default     = "B1"
}

variable "spsitescaling" {
  type        = bool
  description = "Check if the scaling is enabled per site"
  default     = false
}

variable "rgname" {
  type        = string
  description = "The resource group that host the azure web app"
}

variable "tags" {
    type        = map
    description = "The tags of the azure web app" 
    default     = {}

}

variable "spworkercount" {
    type        = number
    description = "The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU" 
    default     = 1
}

variable "spzonebalancing" {
  type        = bool
  description = "hould the Service Plan balance across Availability Zones in the region"
  default     = false
}

variable "azwebappkeys" {
  type        = map
  description = "The key used with the azure web app settings"
  default     = {}
}

variable "azwebappclientaffinity" {
  type        = bool
  description = "Should the App Service send session affinity cookies, which route client requests in the same session to the same instance?"
  default     = false
}

variable "azwebappclientcertificate" {
  type        = bool
  description = "Does the App Service require client certificates for incoming requests?"
  default     = false
}

variable "azwebappclientcertificatemode" {
  type        = string
  description = "Mode of client certificates for this App Service: required|Optional|OptionalInteractiveUser "
  default     = "Optional"
}

variable "azwebappenabled" {
  type        = bool
  description = "Does the App Service enabled?"
  default     = true
}

variable "azwebapphttpsonly" {
  type        = bool
  description = "Does the App Service accessible only via HTTPS?"
  default     = true
}

variable "azwebappname" {
  type        = string
  description = "the name of the azure web app - must be unique"
}

variable "alwayson" {
    type    = bool
    description = "should the app be loaded at all times ?"
    default     = true
}

variable "usemngdidntycontainerregistry" {
    type    = bool
    description = "use the managed identity of the container registry?"
    default     = false
}

variable "ftpsstate" {
    type    = string
    description = "State of FTP / FTPS service for this function app:AllAllowed|FtpsOnly|Disabled "
    default     = "Disabled"
}

variable "healthcheckenviction" {
    type    = number
    description = "he amount of time in minutes that a node can be unhealthy before being removed from the load balancer"
    default     = 2
}

variable "http2enabled" {
    type    = bool
    description = "Specifies if the HTTP2 protocol should be enabled"
    default     = false
}

variable "loadbalancingmode" {
    type    = string
    description = "The Site load balancing mode: eightedRoundRobin|LeastRequests|LeastResponseTime|WeightedTotalTraffic|RequestHash|PerSiteRoundRobin "
    default     = "LeastRequests"
}

variable "localmysql" {
    type    = bool
    description = "use of local mysqm"
    default     = false
}

variable "managedpipeline" {
    type    = string
    description = "Managed pipeline mode: Integrated|Classic "
    default     = "Integrated"
}

variable "tlsversion" {
    type    = string
    description = "the minimum tls version "
    default     = "1.2"
}

variable "remotedebugging" {
    type    = string
    description = "the minimum tls version "
    default     = "1.2"
}

variable "bitworker32" {
    type    = bool
    description = "The worker process must be 32 bit "
    default     = true
}

variable "nodeversion" {
    type    = string
    description = "The node version of web app:  "
    default     = "18-lts"
}

variable "githubrepo" {
    type    = string
    description = "The ghithub repository url  "
}

variable "githubbranch" {
    type    = string
    description = "The ghithub repository branch  "
    default     = "main"
}

variable "githubtokenvalue"{
  type  = string
  description = "The github Token value"
}

variable app_cnamevalue{
  type  = string
  description = "the cname vaule for the web app"
}

variable app_domainevalue{
  type  = string
  description = "the custom domaine used for the web app"
}

variable rg_dnszone{
  type  = string
  description = "the ressourse group of the domaine used for the web app"
}
