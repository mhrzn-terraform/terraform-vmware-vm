# VMware VM Terraform module

Terraform module which creates Virtual Machine (VM) in VMWare vcenter infrastructure.

## Usage

```
provider "vsphere" {
  version        = "2.9.1"
  vsphere_server = "vsphere.example.com"
  user           = "administrator@vsphere.local"
  password       = "vshpere_password"

  allow_unverified_ssl = "true"
}

locals {
  project_name    = "vm"
  env             = "test"
  dc              = "dc2"
}

resource "vsphere_tag_category" "category" {
  name        = "${local.dc}-${local.env}-terraform"
  cardinality = "SINGLE"
  description = "Managed by Terraform"

  associable_types = [
    "VirtualMachine",
    "Datastore",
  ]
}

resource "vsphere_tag" "tag" {
  name        = "${local.dc}-${local.env}-terraform"
  category_id = "${vsphere_tag_category.category.id}"
  description = "Managed by Terraform"
}

resource "vsphere_custom_attribute" "attribute" {
  name                = "${local.dc}-${local.env}-terraform"
  managed_object_type = "VirtualMachine"
}

module "vm" {
    source              = "mhrzn-terraform/vm/vmware"
    version             = "1.1.5"
    project_name        = "${local.project_name}"
    dc                  = "${local.dc}"
    env                 = "${local.env}"
    vsphere_datacenter  = "Datacenter01"
    vsphere_cluster     = "APP"
    vm_datastore        = "SSD_DATASTORE"
    host                = "esxi-host1.example.com"
    vm_name             = "vmapp01"
    vm_cpu              = 1
    vm_ram              = 1024
    vm_guest_id         = "ubuntu64Guest"
    vm_iso              = "ubuntu-20.04.6-live-server-amd64.iso"
    vm_template         = "ubuntu-template"
    vm_disk             = 100
    thin_provisioned    = false
    vm_network          = "vm_network"
    ipv4_address_nt     = "192.168.0.10"
    ipv4_netmask        = 24
    ipv4_gateway        = "192.168.0.1"

    depends_on           = [
      vsphere_tag_category.category
    ]
}
```
