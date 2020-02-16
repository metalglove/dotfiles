#!/bin/bash
source $(dirname "$0")/update_checker.sh
source $(dirname "$0")/layout_checker.sh

# Runs the i3status config while prepending a custom script
i3status | while :
do
        read line
        check_updates
        check_layout
        echo "$update_status | $layout_status | $line" || exit 1
done
