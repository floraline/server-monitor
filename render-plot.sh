#!/bin/bash

cd "${0%/*}"

# the plotfile to render
PLOTFILE=$1
# the datafile to use to calculate time span
# x axis will span the entire range of time in the data file
DATAFILE=$2
# the number of days to draw
DAYS=$3

if [ $# -eq 1 ]; then
  DATAFILE=$PLOTFILE
fi

T_LATEST=$(cat ./data/$DATAFILE | \
  awk 'END{print $1}')
T_EARLIEST=$(echo "$T_LATEST" | \
  sed s/_/' '/ | \
  { read gmt ; date +"%D_%H:%M" -d "$gmt EDT -$DAYS day" ; })

gnuplot -c plot/$PLOTFILE.plot $T_EARLIEST, $T_LATEST

exit $?

