# Downloading Debian

First, if you haven't done so yet, install the [Debian GPG public
key](https://keyring.debian.org/) so you can verify Debian downloads.  Run
the [installDebianKey.sh](installDebianKey.sh) script to do this.

Then run the [downloadDebian.sh](downloadDebian.sh) script.  This script
invokes [verifyDebian.sh](verifyDebian.sh).  Don't continue until the
integrity of the download is properly verified.

# Preseed

The [debian-preseed.cfg](debian-preseed.cfg) file is derived from the
example preseed file provided by Debian for each release.

Download the example preseed from:
https://www.debian.org/releases/RELEASENAME/example-preseed.txt (also
provided for the Debian release in use in the local
[example-preseed.txt](example-preseed.txt) file).

Replace RELEASENAME with the appropriate name for the release: e.g., if
using the stretch release:
```
wget https://www.debian.org/releases/stretch/example-preseed.txt -O example-preseed.txt.orig
```

If a new release of Debian is used, the
[debian-preseed.cfg](debian-preseed.cfg) file will likely need to be updated
based on the example for the new release.

The [preseed.patch](preseed.patch) file is generated with:
`./genPreseedPatchFile.sh`.  This patch file should be regenerated each time
[debian-preseed.cfg](debian-preseed.cfg) is modified or when you upgrade to
use a new Debian release.

# Notable Preseed Configuration Items

* The most important thing to note is the password for the user account
  created during Debian installation.  By default, the password checked into
  this repository is extremely obvious, insecure and known by all.  Change
  it.  this would be the `passwd/user-password` and
  `passwd/user-password-again` lines.  This username and password is also
  configured in [packer-bidms.json](../packer-bidms.json) as `ssh_user` and
  `ssh_pass`.
* You may or may not be using an apt cache mirror.  It's not required, but
  it is highly recommended you do so (see
  [bidms-docker-apt-cacher](http://github.com/calnet-oss/bidms-docker-apt-cacher))
  because you're going to be downloading files from APT over and over again
  when using Packer to build Debian VMs.  Look for the `mirror/http' lines
  in the preseed file and especially the `mirror/http/hostname`.  The APT
  cache proxy hostname is also configured in
  [packer-bidms.json](../packer-bidms.json) as `replace_deb_mirror` and
  `deb_mirror_proxy`.
