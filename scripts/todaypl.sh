#!/bin/sh
source botvars
  echo 'last_pl=0.0' > ./tmp/lastpl.txt
  echo 'today_pl=0.0' > ./tmp/todaypl.txt
  while true; do
    . ./tmp/lastpl.txt
    . ./tmp/todaypl.txt
    if [ $today_pl != $last_pl ]
    then
      echo need to update.. today $today_pl last $last_pl
      ssh ${SSHHOST} "echo $(date "+%Y-%m-%d %H:%M:%S") ${today_pl} > ${HTMLPATH}/$(date +%Y)/$(date +%m)/$(date +%Y%m%d)-pl.txt"
      echo ssh $?
      curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"realized p/l:\$${today_pl}\"}" ${DISCORDURL1}
      echo discord $?
      curl -X POST -H "Content-Type: application/json" -d "{\"text\": \"realized p/l:\$${today_pl}\"}" ${SLACKURL1}
      echo slack $?
      echo "last_pl=${today_pl}" > ./tmp/lastpl.txt
    fi
    sleep 60
  done
