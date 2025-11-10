#!/bin/bash
set -euo pipefail

ln -s /etc/djs/daemontools.js/svc.js /sbin/svc
ln -s /etc/djs/daemontools.js/supervise.js /sbin/supervise
ln -s /etc/djs/daemontools.js/svscan.js /sbin/svscan
ln -s /etc/djs/daemontools.js/svwait.js /sbin/svwait
ln -s /etc/djs/daemontools.js/svstat.js /sbin/svstat
ln -s /etc/djs/daemontools.js/envdir.js /sbin/envdir

echo done.