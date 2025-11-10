#!/bin/bash
set -euo pipefail

mv /etc/djs/extra/halt /sbin/halt
mv /etc/djs/extra/poweroff /sbin/poweroff
mv /etc/djs/extra/reboot /sbin/reboot
ln -s /etc/djs/startup /bin/init

echo done.