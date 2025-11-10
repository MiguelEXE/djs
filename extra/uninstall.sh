#!/bin/bash

mv /bin/init /etc/djs/extra/init
mv /sbin/poweroff /etc/djs/extra/poweroff
mv /sbin/reboot /etc/djs/extra/reboot
mv /sbin/halt /etc/djs/extra/halt

rm /sbin/svc
rm /sbin/supervise
rm /sbin/svscan
rm /sbin/svwait
rm /sbin/svstat
rm /sbin/envdir

echo done.
echo
echo wont delete /etc/djs/daemontools.js as this can brick your system
echo reboot into to another init system and remove this directory