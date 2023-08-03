variable "project_name" {
  type = string
  description = "Name of the project"
}

variable "dc" {
  type = string
  description = "Datacenter Name"
}

variable "env" {
  type = string
  description = "Environment to deploy vm"
}

variable "vm_name" {
  description = "The name of the vSphere virtual machines and the hostname of the machine"
}

variable "vm_cpu" {
  description = "Number of vCPU for the vSphere virtual machines"
}

variable "vm_ram" {
  description = "Amount of RAM for the vSphere virtual machines (example: 2048)"
}


variable "vm_guest_id" {
  description = "Virtual Machine guest ID"
}

variable "vm_iso" {
  description = "VM image iso name"
}

variable "vm_disk" {
  description = "Amount of storage for the vSphere virtual machines (example: 2048)"
}

variable "thin_provisioned" {
  description = "set to true, the disk space is zeroed out when the virtual machine is created. This will delay the creation of the virtual disk. Cannot be set to true when thin_provisioned is true. See the section on picking a disk type for more information. Default: false."
}

variable "vsphere_datacenter" {
  description = "vSphere datacenter"
}

variable "vsphere_cluster" {
  description = "vSphere cluster"
  default     = ""
}

variable "vm_datastore" {
  description = "Datastore used for the vSphere virtual machines"
}

variable "vm_network" {
  description = "Network used for the vSphere virtual machines"
}

variable "vm_template" {
  description = "VM template name"
}

variable "host" {
  description = "ESXI Host Name"
}

variable "ipv4_address_nt" {
  description = "IP addresses for network interface 1"
}

variable "ipv4_gateway" {
  description = "Gateway address"
}

variable "ipv4_netmask" {
  description = "Mask address"
}
