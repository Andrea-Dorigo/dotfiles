echo $(setxkbmap -query | awk '$1{print $2}'| awk 'NR==3')
