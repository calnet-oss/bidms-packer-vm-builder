#!/bin/sh

DEBIAN_VERSION=$(cat debian/debianVersion.txt)

if [ ! -e debian/debian-${DEBIAN_VERSION}-amd64-xfce-CD-1.iso ]; then
  echo "Missing: debian/debian-${DEBIAN_VERSION}-amd64-xfce-CD-1.iso"
  echo "Download with debian/downloadDebian.sh and verify with"
  echo "debian/verifyDebian.sh"
  exit 1
fi

echo "Prerequisite checks succeeded."
