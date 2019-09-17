#!/bin/bash

#sudo apt -y install xdpyinfo awk bc xdotool

export DISPLAY=:0
i=0

d="$(date +'%H:%M:%S')"
exitTime="$(date --date='10 seconds' +'%H:%M:%S')"

xMax=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f 1)
yMax=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f 2)

while [[ "$d" != "$exitTime"  ]]; do
	d="$(date +'%H:%M:%S')"
	((i++))
	#x:(cos(i/40) * r + sin(i/30) * r * 3.5 + xMax/2)
	#y:(sin(i/40) * r + sin(i/30) * r * 3.5 + yMax/2)
	xdotool mousemove "$(awk -v i="$i" -v x="$xMax" 'BEGIN{r=(x/10); print ( cos(i/40)*r + sin(i/30)*r*3.5 + x/2 ) }')" "$(awk -v i="$i" -v y="$yMax" 'BEGIN{r=(y/10); print ( sin(i/40)*r + cos(i/30)*r*2 + y/2 ) }')"
done

exit 0
