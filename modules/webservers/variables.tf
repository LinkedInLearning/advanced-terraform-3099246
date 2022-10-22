variable "project_id" {
    type = string
}

variable "server_settings" {
    type = map(object({machine_type=string, labels=map(string)}))
}

variable "prefix" {
    type = string
    default = "web"
}

variable "network_interface" {
    type = object({network=string, subnetwork=string})
}

variable "region" {
    type = string
}

variable "zone" {
    type = string
}