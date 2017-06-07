#!/bin/bash

existing=`i3-msg -t get_workspaces | tr , '\n'| grep num| cut -d : -f 2`

echo $existing

for i in $(seq 1 9)
do
    echo $i
    if [[ $existing != *$i* ]]
    then
        i3-msg workspace $i
        break
    fi
done

# i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))

