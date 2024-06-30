#!/usr/bin/env bash


# Triggers a default notification (usually used to get a notification after a long
# running process is finished) for example: ffmpeg -i input out && nd
nd() {
    currentTime=`date +"%I:%M %p"`
    notify "Process finished at $currentTime!"
}

# Triggers a notification using apple script
notify() {
    content=$1
    title="${2:-Terminal}"
    subtitle=$3

    osascript -e "display notification \"$content\" with title \"$title\" subtitle \"$subtitle\""
}

# Refreshes/Reloads the current terminal session.
refresh() {
    source ~/.zshrc
}
