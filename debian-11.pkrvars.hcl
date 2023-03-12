
vm_name = "debian-11-6"
guest_os_type = "Debian_64"

disk_size=120000
memory=4096
cpus=2

iso_url = "debian-11.6.0-amd64-dvd-1.iso"
iso_checksum = "55f6f49b32d3797621297a9481a6cc3e21b3142f57d8e1279412ff5a267868d8"
guest_additions_url = "VBoxGuestAdditions_6.1.38.iso"
guest_additions_sha256 = "54e62a292bd0178d352d395bb715fd8cd25927cc955ef052d69d4b42f2587165"
guest_additions_path = "/home/vagrant/VBoxGuestAdditions.iso"
boot_command = [
	"<esc><wait><bs><bs><bs>",
	"install auto=true priority=critical hostname={{ .Name }} ",
	"preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian-11.cfg",
	"<enter>"
]
conn_username = "vagrant"
conn_password = "vagrant"
shutdown_command = "sudo poweroff"

