#!/bin/sh
# Recover disk space removing every snapshot
for snapshot in `zfs list -H -t snapshot | cut -f 1`
do
  /sbin/zfs destroy $snapshot
done

