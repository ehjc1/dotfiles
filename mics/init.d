#!/bin/bash

/* This script is to disable suspend/sleep mode completely */
nohup systemd-inhibit --why="Disable sleep" --mode=block /usr/bin/bash -c "while true; do sleep 120; done" >/dev/null 2>&1 &

exit 0
