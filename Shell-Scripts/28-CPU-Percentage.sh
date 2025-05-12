#!/bin/bash

ps -eo pid,%cpu,comm --sort=-%cpu | awk '$2 > 90 {print $1}' | while read pid ; do kill -9 "$pid" done 