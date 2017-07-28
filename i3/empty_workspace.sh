#!/bin/bash

existing=`i3-msg -t get_workspaces | tr , '\n'| grep num| cut -d : -f 2`

# echo $existing

for i in $(seq 1 9)
do
    echo $i
    if [[ $existing != *$i* ]]
    then
        if [[ "move" == $1 ]]
        then
            i3-msg move container to workspace $i
        fi
        i3-msg workspace $i
        break
    fi
done

