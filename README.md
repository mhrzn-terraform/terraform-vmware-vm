# VMware VM Terraform module

Terraform module which creates Virtual Machine (VM) in VMWare vcenter infrastructure.

## Usage

```
module "vm" {
    source              = "github.com/mhrzn-terraform/terraform-vmware-vm"
    project_name        = "VMWare-VM"
    dc                  = "dc1"
    env                 = "test"
    vsphere_datacenter  = "datacenter1"
    vsphere_cluster     = "cluster1"
    vm_datastore        = "datastore1"
    host                = "host1"
    vm_name             = "TEST-VM-1"
    vm_cpu              = 1
    vm_ram              = 1024
    vm_guest_id         = ubuntu64Guest
    vm_iso              = "ubuntu-20.04.6-live-server-amd64.iso"
    vm_template         = "UBUNTU_TEMPLATE"
    vm_disk             = 100
    thin_provisioned    = false
    vm_network          ="vm_network1"
    ipv4_address_nt     = 192.168.0.10
    ipv4_netmask        = 24
    ipv4_gateway        = 192.168.0.1
}
```