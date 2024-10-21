
################
# Variables for naming convention

#---------
# Compagny trigram
variable "company_trig" {
  default = "AZC"
}
#---------
# Environment
variable "env" {
  default = "POC"
}

#---------
# Short Service/Project name 
variable "service_name" {
  type    = string
  default = "TST"
}

################
# Souscription
variable "subscription_id" {} # = Environment variable TF_VAR_subscription_id

################
# Location
variable "location" {
  default = "francecentral"
}

################
# DNS Zone
variable "zone_name" {
  default = ""
}

################
# AppService for Test 
variable "appservice_plan_name" {
  default = ""
}
variable "appservice_name" {
  default = ""
}

################
# Tags

variable "app_code" {}
variable "app_owner" {}
variable "date_creation" {}
variable "app_criticity" {}
variable "technical_contact" {}

variable "auto_shutdown_schedule" {
  default = "never"
}
