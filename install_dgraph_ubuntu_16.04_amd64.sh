#!/bin/bash

if ! [ -x "$(command -v shasum)" ]; then
  echo 'Error: shasum is not installed. Install perl; shasum can be found in the perl package.' >&2
  exit 1
fi

curl https://nightly.dgraph.io -sSf | bash

mkdir -p /var/lib/dgraph
mkdir -p /var/lib/dgraph/data
mkdir -p /var/lib/dgraph/exports
rm /var/lib/dgraph/config.yaml
cp ./config.yaml /var/lib/dgraph/config.yaml
rm /etc/systemd/system/dgraph.service
cp ./dgraph.service /etc/systemd/system/dgraph.service

systemctl daemon-reload
systemctl start dgraph
systemctl status dgraph
