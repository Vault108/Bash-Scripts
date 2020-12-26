#!/bin/bash
removelog="/var/log/removelog"
if [ $# -eq 0 ] ; then
    echo "Usage: $0 [-s] lists of files or directories" >&2
    exit 1
fi
if [ "$1" = "-s" ] ; then
    # silent operation requested .... dont log
    shift
else
    echo "$(date): ${USER}: $@" >> $removelog
fi

/bin/rm.old "$@"

exit 0
