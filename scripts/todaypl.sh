#!/bin/sh
. ../botvars
  echo 'last_pl=0.0' > ../tmp/lastpl.txt
  echo 'today_pl=0.0' > ../tmp/todaypl.txt
  while true; do
    . ../tmp/lastpl.txt
    . ../tmp/todaypl.txt
    if [ $today_pl != $last_pl ]
    then
      echo need to update.. today $today_pl last $last_pl
      scp ../tmp/todaypl.txt ${sshhost}:${htmlpath}/$(date +%Y)/$(date +%MM)/$(date +%DD)pl.txt
      echo ssh $?
      curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"realized p/l:\$${today_pl}\"}" ${discordurl1}
      echo discord $?
      echo "last_pl=${today_pl}" > ../tmp/lastpl.txt
    fi
    sleep 60
  done
