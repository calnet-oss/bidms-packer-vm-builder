#!/bin/sh

if [ ! -e debian/debian-9.3.0-amd64-xfce-CD-1.iso ]; then
  echo "Missing: debian/debian-9.3.0-amd64-xfce-CD-1.iso"
  echo "Download with debian/downloadDebian.sh and verify with"
  echo "debian/verifyDebian.sh"
  exit 1
fi

echo "Prerequisite checks succeeded."
