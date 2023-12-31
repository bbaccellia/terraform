// Sensitive Variables declared are in doppler
// Run #doppler run -c tfvm --name-transformer tf-var -- terraform plan
// Run #doppler run -c tfvm --name-transformer tf-var -- terraform apply
// See https://docs.doppler.com/docs/terraform


provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_username
  password             = var.vsphere_password
  allow_unverified_ssl = var.vsphere_insecure
}

data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "pool" {
  name          = format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  count                   = var.vm_count
  name                    = "${var.vm_names}${count.index + 1}"
  # folder                  = var.vsphere_folder
  num_cpus                = var.vm_cpus
  memory                  = var.vm_memory
  firmware                = var.vm_firmware
  efi_secure_boot_enabled = var.vm_efi_secure_boot_enabled
  guest_id                = data.vsphere_virtual_machine.template.guest_id
  datastore_id            = data.vsphere_datastore.datastore.id
  resource_pool_id        = data.vsphere_resource_pool.pool.id
  
  // The first nic
  network_interface {
    network_id = data.vsphere_network.network.id
    }
  
  // The second nic
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label            = "disk0"
    unit_number = 0
    size             = 30
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    datastore_id     = data.vsphere_datastore.datastore.id
  }
  disk {
    label            = "disk1"
    unit_number = 1
    size             = 30
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    datastore_id     = data.vsphere_datastore.datastore.id
  }
  disk {
    label            = "disk2"
    unit_number = 2
    size             = 50
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    datastore_id     = data.vsphere_datastore.datastore.id
  }
  disk {
    label            = "disk3"
    unit_number = 3
    size             = 50
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    datastore_id     = data.vsphere_datastore.datastore.id
  }
  disk {
    label            = "disk4"
    unit_number = 4
    size             = 50
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    datastore_id     = data.vsphere_datastore.datastore.id
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${var.vm_hostname}${count.index + 1}"
        domain    = var.vm_domain
      }
      network_interface {
        ipv4_address = "${var.vm_ipv4_address}${count.index + 1}"
        ipv4_netmask = var.vm_ipv4_netmask
      }

      network_interface {
        ipv4_address = "${var.vm_ipv4_address2}${count.index + 1}"
        ipv4_netmask = var.vm_ipv4_netmask2
      }

      ipv4_gateway    = var.vm_ipv4_gateway
      dns_suffix_list = var.vm_dns_suffix_list
      dns_server_list = var.vm_dns_server_list
    }
  }
  lifecycle {
    ignore_changes = [
      clone[0].template_uuid,
    ]
  }
}