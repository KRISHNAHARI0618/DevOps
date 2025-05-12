#!/bin/bash

SDIR="/usr/shr/nginx"
DDIR="user@backupserver:/backupserver/data"

rsync -r --delete "$SDIR" "$DDIR"
scp -r 

echo "BackUp Processed Successfully"


# Ip Address


