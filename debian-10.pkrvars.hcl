
vm_name = "debian-10-11"
guest_os_type = "Debian_64"

disk_size=120000
memory=2048
cpus=2

iso_url = "debian-10.11.0-amd64-dvd-1.iso"
iso_checksum = "ee63ab538efbf73e6e3e363395599d52b9981655c2327e560c2cbcf3a93095ec"
guest_additions_url = "VBoxGuestAdditions_6.1.38.iso"
guest_additions_sha256 = "54e62a292bd0178d352d395bb715fd8cd25927cc955ef052d69d4b42f2587165"
guest_additions_path = "/home/vagrant/VBoxGuestAdditions.iso"
boot_command = [
	"<esc><wait><bs><bs><bs>",
	"install auto=true priority=critical hostname={{ .Name }} ",
	"preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian-10.cfg",
	"<enter>"
]
conn_username = "vagrant"
conn_password = "vagrant"
shutdown_command = "sudo poweroff"

