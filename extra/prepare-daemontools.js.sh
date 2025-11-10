#!/bin/bash
set -euo pipefail

mkdir /etc/djs/daemontools.js
cd /etc/djs/daemontools.js-repo
npm run:build

mv dist/* ../daemontools.js/
cd ..
rm -rf /etc/djs/daemontools.js-repo

echo done.