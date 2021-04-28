#!/bin/zsh
# LICENSE: PUBLIC DOMAIN
# switch between my layouts
# If an explicit layout is provided as an argument, use it. Otherwise, select the next layout from
# the set [us, it, fr].
    layout=$(setxkbmap -query | awk '$1{print $2}'| awk 'NR==3')
    case $layout in
        us)
                setxkbmap it
            ;;
        *)
                setxkbmap us
            ;;
    esac
