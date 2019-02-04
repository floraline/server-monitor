#!/bin/bash

WEBDIR=/var/www/monitor/
WEBINDEX=index.html

cd "${0%/*}"
./render-plot.sh multi cpu-load 1
./render-plot.sh multi-7 cpu-load 7

if [ $? -eq 0 ]
then
  mv ./output/* $WEBDIR
  touch "$WEBDIR$WEBINDEX"
else
  echo "Failed to generate plot" >&2
  exit
fi

