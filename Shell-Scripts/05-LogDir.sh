#!/bin/bash

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
DAYS=7

mkdir -p "$ARCHIVE_DIR"

find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS -exec gzip {} \; -exec mv {}.gz "$ARCHIVE_DIR" \;

echo "Old logs archived to $ARCHIVE_DIR"

ARCHIEVE_DIR="archieve"

mkdir -p "$ARCHIEVE_DIR"
