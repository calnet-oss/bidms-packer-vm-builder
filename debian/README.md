The [debian-preseed.cfg](debian-preseed.cfg) file is derived from the
example preseed file provided by Debian for each release.

Download the example preseed from:
https://www.debian.org/releases/RELEASENAME/example-preseed.txt

Replace RELEASENAME with the appropriate name for the release: e.g., if
using the stretch release:
```
wget https://www.debian.org/releases/stretch/example-preseed.txt -O example-preseed.txt.orig
```

If a new release of Debian is used, the
][debian-preseed.cfg](debian-preseed.cfg) file will likely need to be
updated based on the example for the new release.

The [preseed.patch](preseed.patch) file is generated with:
`./genPreseedPatchFile.sh`.  This patch file should be regenerated each time
[debian-preseed.cfg](debian-preseed.cfg) is modified or when you upgrade to
use a new Debian release.
