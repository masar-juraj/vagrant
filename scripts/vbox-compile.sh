#!/bin/bash

VBOX_ISO="/home/vagrant/VBoxGuestAdditions.iso"
VBOX_MNT="/mnt"
VBOX_BIN="$VBOX_MNT/VBoxLinuxAdditions.run"

if [ -e "$VBOX_ISO" ]; then
	sudo mount -o loop $VBOX_ISO $VBOX_MNT
	RET=$?
	if [ $RET -ne 0 ]; then
		echo "Nie je mozne pripojit $VBOX_ISO do $VBOX_MNT"
		exit $RET
	fi
	sudo $VBOX_BIN
	sudo umount $VBOX_MNT
fi
exit 0

