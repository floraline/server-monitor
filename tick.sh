#!/bin/bash
# point cron at this file

cd "${0%/*}"
./collect-all.sh
./render-all.sh

