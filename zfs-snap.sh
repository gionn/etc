#!/bin/sh
# Requires zfs-snapshot-clean from ports.
# Add it in cron with:
#   17 * * * * /usr/local/etc/zfs-snap.sh

DATASET="tank/public tank/homes tank/freebsd-local"
for vol in $DATASET; do
  /sbin/zfs snapshot "$vol@$(date +%Y-%m-%d)" && /usr/local/sbin/zfs-snapshot-clean "$vol"
done
