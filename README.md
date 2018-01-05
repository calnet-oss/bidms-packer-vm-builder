This uses [Packer](http://www.packer.io/) to build a
[Debian](http://www.debian.org/) BIDMS virtual machine.  Currently, a
[QEMU](http://www.qemu.org/) virtual machine image is created.  Our [Packer
directives file](packer-bidms.json) also has a
[VirtualBox](http://www.virtualbox.org/) provisioner however this not yet
well tested and is, for the most part, currently unused.

Packer must be installed to run these scripts to build the virtual machine. 
See the [debian/README.md](debian/README.md) file for information regarding
the [Debian preseed file](debian/debian-preseed.cfg), which automates Debian
installation in conjunction with the [Packer directives
file](packer-bidms.json).  There are a few things you will probably need to
configure in the [debian/debian-preseed.cfg](debian/debian-preseed.cfg) and
[packer-bidms.json](packer-bidms.json) files.  The top two configuration
items would be the default user password and the [APT cache
proxy](/calnet-oss/bidms-docker-apt-cacher) hostname.  Both of these items
are configured in both the preseed file and the Packer directives file, so
if you modify one file you have to modify the other too.

You also need to download and verify the Debian installer image.  See
[debian/README.md](debian/README.md) for instructions.

For [QEMU](http://www.qemu.org/), there are some Linux modules to make sure
are installed:
```
modprobe -v kvm
modprobe -v virtio
modprobe -v virtio_blk
modprobe -v virtio_net
```

Although Packer may not use other [QEMU](http://www.qemu.org/) virtio
drivers during installation, it's worth noting you may want other virtio
drivers when running the VM (depends on command line options you pass to
QEMU), such as:
* virtio-rng
* virtio_scsi
* virtio_pci

Each Linux distribution may have a different way of loading these modules on
boot if they're not already being loaded.  For [RedHat Enterprise
Linux](http://www.redhat.com/), instructions are here:
* [RHEL 7 Persistent Module Loading](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Kernel_Administration_Guide/sec-Persistent_Module_Loading.html)

After Debian has been downloaded and verified and the
[preseed](debian/debian-preseed.cfg) and [Packer
directives](packer-bidms.json) files are configured to your liking, build
the VM with:
```
./build-qemu.sh
```

The VM image is placed in the `output-qemu` directory.

If there's a problem and you need to debug, or you just want to see what's
going on in general, you can see the VM console using a couple different
means:
* If your session is X-capable, turn headless mode off by editing
[packer-bidms.json](packer-bidms.json) and changing `headless` to `false`.
* Connect to the QEMU console during installation by using a VNC client. 
When running the [build-qemu.sh](build-qemu.sh) script, Packer will give you
the VNC port number to use.

# License

These scripts are licensed under the [BSD two-clause license](LICENSE.txt).
