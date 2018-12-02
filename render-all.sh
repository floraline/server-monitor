#!/bin/bash

WEBDIR=/var/www/monitor/

cd "${0%/*}"
./render-plot.sh multi cpu-load

if [ $? -eq 0 ]
then
  mv ./output/* $WEBDIR
else
  echo "Failed to generate plot" >&2
  exit
fi

