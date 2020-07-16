#!/bin/bash
# Elasticsearch (Java Program) Monitor - Cron Job
# Restart Elasticsearch when it goes down
# Ubuntu 18.04 LTS - JJK 6/30/29
#
# This cron job needs to run as root (sudo crontab -e)
# To run it every 10 minutes:
# */10 * * * * /home/jim/e.sh

RESTART="/bin/systemctl restart elasticsearch.service"
USER="elasticsearch"

# Path to pgrep command
PGREP="/usr/bin/pgrep"

# Get the Elasticsearch username if it running
TEST=`ps -C java -o user | grep elasticsearch`
# echo $TEST

# Test if username (elasticsearch) is running
if [ "$TEST" = $USER ]
then
 # If Elasticsearch is running, do nothing
 # echo Elasticsearch is running
 TMP=1
else
 # If Elasticsearch is NOT running, restart it!
 # echo Elasticsearch is NOT running!!!
 # echo Restarting Elasticsearch!
 TMP=0
 $RESTART
fi

