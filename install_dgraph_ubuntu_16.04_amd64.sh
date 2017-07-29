#!/bin/bash

if ! [ -x "$(command -v shasum)" ]; then
  echo 'Error: shasum is not installed. Install perl; shasum can be found in the perl package.' >&2
  exit 1
fi

curl https://nightly.dgraph.io -sSf | bash

mkdir /var/lib/dgraph
mkdir /var/lib/dgraph/data
mkdir /var/lib/dgraph/exports
cp ./config.yaml /var/lib/dgraph/config.yaml
cp ./dgraph.service /etc/systemd/system/dgraph.service

systemctl start dgraph
systemctl status dgraph
