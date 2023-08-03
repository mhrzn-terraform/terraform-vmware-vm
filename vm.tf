//resource "vsphere_custom_attribute" "attribute" {
//  name                = "${var.dc}-${local.env}-terraform"
//  managed_object_type = "VirtualMachine"
//}

resource "vsphere_virtual_machine" "vm" {
  name             = "${var.dc}-${var.vm_name}-${local.env}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  host_system_id   = "${data.vsphere_host.host.id}"

  num_cpus = "${var.vm_cpu}"
  memory   = "${var.vm_ram}"

  guest_id = "${var.vm_guest_id}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    use_static_mac        = false
  }

  disk {
    label            = "${var.vm_name}-${local.env}.vmdk"
    size             = "${var.vm_disk}"
    thin_provisioned = "${var.thin_provisioned}"
  }

  //cdrom {
  //  datastore_id = "${data.vsphere_datastore.datastore.id}"
  //  //device_address = "sata:0:0"
  //  path         = "/ISO/${var.vm_iso}"
  //}

  clone {
    linked_clone = false
    ovf_network_map = {}
    ovf_storage_map = {}
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      dns_server_list = []
      dns_suffix_list = []
      linux_options {
        host_name = "${var.vm_name}-${local.env}"
        domain    = "khalti.office"
      }

      network_interface {
        ipv4_address = var.ipv4_address_nt
        ipv4_netmask = var.ipv4_netmask
        ipv6_netmask = 0
        dns_server_list = ["8.8.8.8","8.8.4.4"]
      }
      ipv4_gateway = var.ipv4_gateway
    }
  }

  tags = [data.vsphere_tag.tag.id]

  cpu_share_count = 2000
  boot_delay = 0
  boot_retry_enabled = false
  cpu_hot_add_enabled = false
  cpu_hot_remove_enabled = false
  cpu_performance_counters_enabled = false
  cpu_reservation = 0
  custom_attributes = tomap({"${data.vsphere_custom_attribute.attribute.id}" = "Khalti"})
  efi_secure_boot_enabled = false
  enable_disk_uuid = false
  enable_logging = false
  extra_config = {
    "guestinfo.metadata"          = <<-EOT
       { "local-hostname": "${var.dc}-${var.vm_name}-${local.env}" }
    EOT
  }
  memory_hot_add_enabled = false
  memory_reservation = 0
  nested_hv_enabled = false
  pci_device_id = []
  run_tools_scripts_before_guest_reboot = false
  sync_time_with_host = false
  
  vbs_enabled = false
  vvtd_enabled = false
}
