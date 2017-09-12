#!/bin/bash

WAKEALARM=/sys/class/rtc/rtc0/wakealarm
SKIP_ALARM=/tmp/skip_alarm_on_next_suspend
SLEEPLENGTH=${SLEEPLENGTH:-"+1hour"}


function print_usage()
{
    echo "Usage: $0 (suspend | resume)"
    echo 
    echo "Default time to hibernate: $SLEEPLENGTH"
    echo
    echo "This script is intended to be called from systemd unit file"
    echo "For example 'suspend-to-hibernate.service':"
    echo "ExecStart=/usr/local/bin/suspend-to-hibernate.sh suspend"
    echo "ExecStop=/usr/local/bin/suspend-to-hibernate.sh resume"
}

function handle_suspend()
{
    echo "Processing suspension"

    if [ -e "$SKIP_ALARM" ]; then
        echo "Skipping alarm"
    else
        echo -n "Alarm set for "
        date +%s -d$SLEEPLENGTH | tee $WAKEALARM
    fi
}

function handle_resume()
{
    echo "Processing resume"

    alarm=$(cat $WAKEALARM)
    now=$(date +%s)
    if [ ! -e "$SKIP_ALARM" ]; then
        if [ -z "$alarm" ] || [ "$now" -ge "$alarm" ]; then
            echo "Alarm wake up detected"
            if [ "$(cat /sys/class/power_supply/AC/online)" = "0" ]; then
                echo "On battery. Trying to hibernate"
                systemctl hibernate
                if [ "$?" -ne 0 ]; then
                    echo "Failed to hibernate. Suspending"
                    # Do not set alarm when suspending
                    touch $SKIP_ALARM
                    sleep 1
                    systemctl suspend
                fi
            else
                echo "On AC. Keep suspending"
                sleep 1
                systemctl suspend
            fi
        else
           echo "Normal wakeup"
       fi
    else
        rm -f $SKIP_ALARM
        echo "Normal wakeup"
    fi
    echo 0 > $WAKEALARM
}

if [ "$1" == "suspend" ]; then
    handle_suspend
elif [ "$1" == "resume" ]; then
    handle_resume
else
    print_usage
    exit -1
fi

