source "virtualbox-iso" "debian" {
	# Zakladne nastavenia
	vm_name			= var.vm_name
	guest_os_type		= var.guest_os_type
	keep_registered		= var.keep_registered
	skip_export		= var.skip_export
	output_directory	= "${var.vbox_vm_dir}/${var.vm_name}"

	# Virtualbox hardware settings
	chipset			= var.chipset
	firmware		= var.firmware
	nested_virt		= var.nested_virt
	hard_drive_interface	= var.hard_drive_interface
	disk_size		= var.disk_size
	iso_interface		= var.iso_interface
	gfx_controller		= var.gfx_controller
	gfx_vram_size		= var.gfx_vram_size
	vboxmanage 		= [
		["modifyvm", "${var.vm_name}", "--memory", "${var.memory}"],
		["modifyvm", "${var.vm_name}", "--pae", "${var.pae}"],
		["modifyvm", "${var.vm_name}", "--nestedpaging", "${var.nestedpaging}"],
		["modifyvm", "${var.vm_name}", "--cpus", "${var.cpus}"],
		["modifyvm", "${var.vm_name}", "--nested-hw-virt", "${var.nested-hw-virt}"],
		["modifyvm", "${var.vm_name}", "--audio", "${var.audio}"],
		["modifyvm", "${var.vm_name}", "--usbohci", "${var.usbohci}"]
	]
	# Unattended installation
	iso_url			= "${var.iso_dir}/${var.iso_url}"
	iso_checksum		= var.iso_checksum
	guest_additions_url	= "${var.iso_dir}/${var.guest_additions_url}"
	guest_additions_sha256	= var.guest_additions_sha256
	guest_additions_path	= var.guest_additions_path
	http_directory		= var.http_dir
	boot_command		= var.boot_command
	ssh_username		= var.conn_username
	ssh_password		= var.conn_password
	shutdown_command	= var.shutdown_command
}

build {
	sources = [
		"sources.virtualbox-iso.debian"
	]
	provisioner "shell" {
		script = "${var.scripts_dir}/vbox-compile.sh"
		valid_exit_codes = [ 0 ]
	}
}

