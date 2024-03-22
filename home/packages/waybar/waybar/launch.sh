#!/bin/sh

killall waybar

if [[ $USER = "filip" ]]
then
    waybar -c ~/dotfiles-old/waybar/config -s ~/dotfiles-old/waybar/style.css
else
    waybar &
fi
