##################################################################################
# VARIABLES
##################################################################################

# Credentials

vsphere_server   = "192.168.0.100"
#vsphere_username = "REMOVED"   via doppler
#vsphere_password = "REMOVED"   via doppler
vsphere_insecure = true

# vSphere Settings

vsphere_datacenter = "DC1"
vsphere_cluster    = "cluster1"
vsphere_datastore  = "SynologyDS"
# vsphere_folder     = "workloads"
vsphere_network    = "VM Portgroup"
vsphere_template   = "Cloudiantemplate16gig"

# Virtual Machines Settings

#vm_name                    = "dc1node0"
#vm_count                   = 3
vm_names                   = "dc1node"
vm_cpus                    = 2
vm_memory                  = 8192
vm_firmware                = "bios"
vm_efi_secure_boot_enabled = false
vm_hostname                = "dc1node"
vm_domain                  = "1-900-steve.com"
vm_ipv4_address            = "192.168.0.7"
vm_ipv4_netmask            = "24"
vm_ipv4_gateway            = "192.168.0.1"
vm_ipv4_address2           = "10.10.10.7"
vm_ipv4_netmask2           = "24"
vm_dns_suffix_list         = ["1-900-steve.com"]
vm_dns_server_list         = ["8.8.8.8", "1.1.1.1"]