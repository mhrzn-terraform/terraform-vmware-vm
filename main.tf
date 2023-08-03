locals {
  project_name = var.project_name
  env = var.env
}

data "vsphere_datacenter" "datacenter" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "${var.vsphere_cluster}"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vm_datastore}"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "${var.vm_network}"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vm_template}"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "host" {
  name          = var.host
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_tag_category" "category" {
  name = "${var.dc}-${local.env}-terraform"
}

data "vsphere_tag" "tag" {
  name        = "${var.dc}-${local.env}-terraform"
  category_id = data.vsphere_tag_category.category.id
}

data "vsphere_custom_attribute" "attribute" {
  name = "${var.dc}-${var.env}-terraform"
}
