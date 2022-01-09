#!/bin/sh
. botvars
# Set Session Name
SESSION="stonks"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Name first Pane and start logstash
    tmux rename-window -t 0 'logstash'
    tmux send-keys -t 'logstash' 'logstash -f ./logstash/orders.yaml' C-m # Switch to bind script?

    # Create and setup pane for daily p/l
    tmux new-window -t $SESSION:1 -n 'todaypl'
    tmux send-keys -t 'todaypl' 'sh ./scripts/todaypl.sh' C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
