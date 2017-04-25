#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -blur 0x6 /tmp/screen.png;
#convert /tmp/screen.png -scale 2% -scale 5000% /tmp/screen.png

#PICTURE=pepe.png
PICTURE=key-256.png

if [[ -f $HOME/.i3/$PICTURE ]]
then
    # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file ~/.i3/$PICTURE | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)
 
    SR=$(xrandr --query | grep ' connected' | sed 's/primary //' | cut -f3 -d' ')
    for RES in $SR
    do
        # monitor position/offset
        echo $RES
        SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2))
        PY=$(($SROY + $SRY/2 - $RY/2))
 
        #convert -font fontawesome -pointsize 120 -fill black -draw 'text '$PX','$PY' "KAFFI" ' /tmp/screen.png /tmp/screen.png
        convert /tmp/screen.png $HOME/.i3/$PICTURE -geometry +$PX+$PY -composite -matte  /tmp/screen.png
        echo "done"
    done
fi

i3lock -u -n -i /tmp/screen.png
#i3lock -u -n -i /home/jakobat/Pictures/Wallpapers/soldark.jpg
