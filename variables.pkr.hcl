##
## Environment settings
##
variable "vbox_vm_dir" {
	type = string
	default = "/home/jmasar/VirtualBox VMs"
}
variable "http_dir" {
	type = string
	default = "http"
}
variable "iso_dir" {
	type = string
	default = "iso"
}
variable "scripts_dir" {
	type = string
	default = "scripts"
}

##
## Packer settings
##
variable "vm_name" {
	type = string
	default = "packer"
}
variable "guest_os_type" {
	type = string
	default = "Linux_64"
}
variable "keep_registered" {
	type = bool
	default = true
}
variable "skip_export" {
	type = bool
	default = true
}
variable "conn_username" {
	type = string
	default = "vagrant"
}
variable "conn_password" {
	type = string
	default = "vagrant"
}

variable "iso_url" {
	type = string
	default = null
}
variable "iso_checksum" {
	type = string
	default = null
}
variable "guest_additions_url" {
	type = string
	default = null
}
variable "guest_additions_sha256" {
	type = string
	default = null
}
variable "guest_additions_path" {
	type = string
	default = "/home/vagrant/VBoxGuestAdditions.iso"
}
variable "boot_command" {
	type = list(string)
	default = [
		"<esc><wait><bs><bs><bs>"
	]
}
variable "shutdown_command" {
	type = string
	default = "sudo poweroff"
}



##
## Virtualbox hardware settings
##
variable "chipset" {
	type = string
	default = "piix3"
}
variable "firmware" {
	type = string
	default = "bios"
}
variable "memory" {
	type = number
	default = 2048
}
variable "pae" {
	type = string
	default = "on"
}
variable "nestedpaging" {
	type = string
	default = "on"
}
variable "cpus" {
	type = number
	default = 2
}
variable "nested_virt" {
	type = bool
	default = true
}
variable "nested-hw-virt" {
	type = string
	default = "on"
}
variable "hard_drive_interface" {
	type = string
	default = "sata"
}
variable "disk_size" {
	type = number
	default = 40000
}
variable "iso_interface" {
	type = string
	default = "ide"
}
variable "gfx_controller" {
	type = string
	default = "vmsvga"
}
variable "gfx_vram_size" {
	type = number
	default = 32
}
variable "audio" {
	type = string
	default = "none"
}
variable "usbohci" {
	type = string
	default = "on"
}

