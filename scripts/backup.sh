#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <thu_muc_can_sao_luu>"
    exit 1
fi

SOURCE="$1"

if [ ! -d "$SOURCE" ]; then
    echo "Loi: Thu muc khong ton tai: $SOURCE"
    exit 2
fi

mkdir -p "$HOME/backup"

NAME=$(basename "$SOURCE")
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

DEST="$HOME/backup/${NAME}_${TIMESTAMP}.tar.gz"

tar -czf "$DEST" -C "$(dirname "$SOURCE")" "$NAME"

echo "$(date '+%Y-%m-%d %H:%M:%S') $DEST" >> "$(dirname "$SOURCE")/logs/backup.log"

echo "Backup thanh cong: $DEST"