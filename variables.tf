variable "project_name" {
  type        = string
  description = "Name of the project"
  default     = "vmware"
}

variable "dc" {
  type        = string
  description = "Datacenter Name"
  default     = "dc1"
}

variable "env" {
  type        = string
  description = "Environment to deploy vm"
  default     = "test"
}

variable "vm_name" {
  description = "The name of the vSphere virtual machines and the hostname of the machine"
  type        = string
  default     = "Test VM"
}

variable "vm_cpu" {
  description = "Number of vCPU for the vSphere virtual machines"
  type        = number
  default     = 1
}

variable "vm_ram" {
  description = "Amount of RAM for the vSphere virtual machines (example: 2048)"
  type        = number
  default     = 2048
}


variable "vm_guest_id" {
  description = "Virtual Machine guest ID"
  type        = string
  default     = "ubuntu64Guest"
}

variable "vm_iso" {
  description = "VM image iso name"
  type        = string
}

variable "vm_disk" {
  description = "Amount of storage for the vSphere virtual machines (example: 2048)"
  type        = string
  default     = "datastore"
}

variable "vm_domain" {
  description = "Domain name for VM"
  type        = string
  default     = "example.com"
}

variable "thin_provisioned" {
  description = "set to true, the disk space is zeroed out when the virtual machine is created. This will delay the creation of the virtual disk. Cannot be set to true when thin_provisioned is true. See the section on picking a disk type for more information. Default: false."
  default     = true
}

variable "vsphere_datacenter" {
  description = "vSphere datacenter"
  type        = string
}

variable "vsphere_cluster" {
  description = "vSphere cluster"
  default     = ""
}

variable "vm_datastore" {
  description = "Datastore used for the vSphere virtual machines"
  type        = string
}

variable "vm_network" {
  description = "Network used for the vSphere virtual machines"
  type        = string
}

variable "vm_template" {
  description = "VM template name"
  type        = string
}

variable "vm_dns1" {
  description = "DNS server for VM"
  type        = string
  default     = "8.8.8.8"
}

variable "vm_dns2" {
  description = "DNS server for VM"
  type        = string
  default     = "8.8.4.4"
}

variable "host" {
  description = "ESXI Host Name"
  type        = string
}

variable "ipv4_address_nt" {
  description = "IP addresses for network interface 1"
  type        = string
}

variable "ipv4_gateway" {
  description = "Gateway address"
  type        = string
}

variable "ipv4_netmask" {
  description = "Mask address"
  type        = string
}
