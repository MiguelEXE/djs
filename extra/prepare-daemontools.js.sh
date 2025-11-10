#!/bin/bash
set -euo pipefail

mkdir /etc/djs/daemontools.js
cd /etc/djs/daemontools.js-repo
npm install
cd src
sed -i 's/^export const DEFAULT_SERVICE_PATH.*$/export const DEFAULT_SERVICE_PATH = "\/etc\/djs\/services"/' common.ts
cd ..
npm run build

mv dist/* ../daemontools.js/
cd ..
rm -rf /etc/djs/daemontools.js-repo

echo done.