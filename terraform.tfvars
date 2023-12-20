##################################################################################
# VARIABLES
##################################################################################

# Credentials

vsphere_server   = "10.93.0.10"
vsphere_username = "administrator@vsphere.local"
vsphere_password = "Cloudian20!"
vsphere_insecure = true

# vSphere Settings

vsphere_datacenter = "Giovanni and Associates"
vsphere_cluster    = "Production"
vsphere_datastore  = "2TBNVMeDS"
# vsphere_folder     = "workloads"
vsphere_network    = "VM Network"
vsphere_template   = "HS7"

# Virtual Machines Settings

#vm_name                    = "dc1node0"
#vm_count                   = 3
vm_names                   = "HS7Node"
vm_cpus                    = 2
vm_memory                  = 8192
vm_firmware                = "bios"
vm_efi_secure_boot_enabled = false
vm_hostname                = "HS7Node"
vm_domain                  = "brento.org"
vm_ipv4_address            = "10.93.0.12"
vm_ipv4_netmask            = "24"
vm_ipv4_gateway            = "10.93.0.1"
vm_ipv4_address2           = "10.95.1.1"
vm_ipv4_netmask2           = "24"
vm_dns_suffix_list         = ["brento.org, baccellia.com"]
vm_dns_server_list         = ["10.93.0.8"]