#!/bin/bash

echo "  Installing..."
echo "  Setting Permissions"
chmod +x ./perconaxtradb/perconaxtradb
chmod +x ./etcd/etcdcontroll
echo "  Copying files"
ln -s ~/scripts/docker-scripts/perconaxtradb/perconaxtradb /usr/local/bin/perconaxtradb
ln -s ~/scripts/docker-scripts/etcd/etcdcontroll /usr/local/bin/etcdcontroll
echo "  Success"
