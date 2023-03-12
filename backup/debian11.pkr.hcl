variable "vm_name" {
	type = string
	default = "debian-11.6"
}
variable "vm_username" {
	type = string
	default = "vagrant"
}
variable "vm_password" {
	type = string
	default = "vagrant"
}
variable "dir_http" {
	type = string
	default = "http"
}
variable "dir_vbox_vms" {
	type = string
	default = "/home/jmasar/VirtualBox VMs"
}

source "virtualbox-iso" "debian11" {
	# Zakladne nastavenia
	vm_name = "${var.vm_name}"
	guest_os_type = "Debian_64"
	keep_registered = true
	skip_export = true
	output_directory = "${var.dir_vbox_vms}/${var.vm_name}"
	# Virtualbox hardver
	chipset = "piix3"
	firmware = "bios"
	nested_virt = "true"
	hard_drive_interface = "sata"
	disk_size = 120000
	gfx_controller = "vmsvga"
	gfx_vram_size = "32"	
	vboxmanage = [
		["modifyvm", "${var.vm_name}", "--memory", "4096"],
		["modifyvm", "${var.vm_name}", "--cpus", "2"],
		["modifyvm", "${var.vm_name}", "--pae", "on"],
		["modifyvm", "${var.vm_name}", "--nested-hw-virt", "on"],
		["modifyvm", "${var.vm_name}", "--nestedpaging", "on"],
		["modifyvm", "${var.vm_name}", "--audio", "none"],
		["modifyvm", "${var.vm_name}", "--usbohci", "on"]
	]
	# Unattended installation
	http_directory = "${var.dir_http}"
	iso_interface = "ide"
	iso_url = "iso/debian-11.6.0-amd64-dvd-1.iso"
	iso_checksum = "55f6f49b32d3797621297a9481a6cc3e21b3142f57d8e1279412ff5a267868d8"
	guest_additions_url = "iso/VBoxGuestAdditions_6.1.38.iso"
	guest_additions_sha256 = "54e62a292bd0178d352d395bb715fd8cd25927cc955ef052d69d4b42f2587165"
	boot_command = [
		"<esc><wait><bs><bs><bs>",
		"install auto=true priority=critical hostname={{ .Name }} ",
		"preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian11.cfg",
		"<enter>"
	]
	ssh_username = "${var.vm_username}"
	ssh_password = "${var.vm_password}"
	shutdown_timeout = "5s"
	shutdown_command = "sudo poweroff"
}

build {
	sources = ["sources.virtualbox-iso.debian11"]
	provisioner "shell" {
		script = "scripts/vbox-compile.sh"
		valid_exit_codes = [ 0 ]
	}
}
