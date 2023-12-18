##################################################################################
# VARIABLES
##################################################################################

# Credentials

variable "vsphere_server" {
  type = string
}

variable "vsphere_username" {
  type = string
}

variable "vsphere_password" {
  type = string
}

variable "vsphere_insecure" {
  type    = bool
  default = false
}

# vSphere Settings

variable "vsphere_datacenter" {
  type = string
}

variable "vsphere_cluster" {
  type = string
}

variable "vsphere_datastore" {
  type = string
}

#variable "vsphere_folder" {
#  type = string
#}

variable "vsphere_network" {
  type = string
}

variable "vsphere_template" {
  type = string
}

# Virtual Machine Settings

#variable "vm_name" {
#  type = string
#}

variable "vm_cpus" {
  type = number
}

variable "vm_memory" {
  type = number
}

variable "vm_firmware" {
  type = string
}

variable "vm_efi_secure_boot_enabled" {
  type = bool
}

variable "vm_hostname" {
  type = string
}

variable "vm_domain" {
  type = string
}

variable "vm_ipv4_address" {
  type = string
}

variable "vm_ipv4_netmask" {
  type = string
}

variable "vm_ipv4_address2" {
  type = string
  description = "ipv4 address of the second nic"
}

variable "vm_ipv4_netmask2" {
  type = string
  description = "subnet mask of the second nic"
}

variable "vm_ipv4_gateway" {
  type = string
}

variable "vm_dns_suffix_list" {
  type = list(string)
}

variable "vm_dns_server_list" {
  type = list(string)
}

# Define variables for VM configuration
variable "vm_count" {
  type = number
#  default = 1  # Change the number of VMs to be created
}

variable "vm_names" {
  type = string
  }

#variable "vm_names" {
#  type = map(any)
#  description = "List of virtual machines to be deployed"
#}