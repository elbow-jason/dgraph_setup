#!/bin/bash

git clone https://github.com/elbow-jason/dgraph_setup.git
cd dgraph_setup
./install_dgraph_ubuntu_16.04_amd64.sh
cd ..
rm -rf graph_setup/
