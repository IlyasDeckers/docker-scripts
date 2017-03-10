#!/bin/bash

echo "  Installing..."
echo "  Setting Permissions"
chmod +x ./perconaxtradb/perconaxtradb
chmod +x ./etcd/etcdcontroll
echo "  Copying files"
cp ./perconaxtradb/perconaxtradb /usr/local/lib
cp ./etcd/etcdcontroll /usr/local/lib
echo "  Success"
