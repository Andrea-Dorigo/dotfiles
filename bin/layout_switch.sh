#!/bin/zsh
# LICENSE: PUBLIC DOMAIN
# switch between my layouts
echo $(setxkbmap -query)
# If an explicit layout is provided as an argument, use it. Otherwise, select the next layout from
# the set [us, it, fr].
    layout=$(setxkbmap -query | awk 'END{print $2}')
    case $layout in
        us)
                setxkbmap it
            ;;
        *)
                setxkbmap us
            ;;
    esac
