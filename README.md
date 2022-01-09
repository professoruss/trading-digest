# trading-digest
## ETrade Pro Log Parser and Web Interface

The purpose of this is to parse my ETrade Pro logs live throughout the trading day and update a website, as well as various chats to share with friends/and keep myself accountable.

### Components:
* **html/** - Base directory for webserver
* **logstash/** - logstash configurations
* **scripts/** - shell script to loop through profit/loss values
* **tmp/** - temp directory for profit/loss script
* **bot.sh** - main script to run locally, triggers running logstash and a profit/loss shell script loop in tmux
* **botvars.example** - example file for variables, copy to botvars and populate with correct values

### Requirements:
* **bash** or a real shell, i haven't touched windows in years so i have no idea what would have to be modified to get this to work
* **tmux** - logstash and p/l scripts run in their own panes within the stonks session
* **ssh keys** - needed to automatically update pl/trade text files on remote host (maybe move locally so user can decide if they want to push to remote host?)
* **curl** - for updating discord/slack
* **Etrade Pro** - for trading, it seems as if other pro platforms have some sort of logging similar to this, maybe develop other logstash configs to support them in the future
