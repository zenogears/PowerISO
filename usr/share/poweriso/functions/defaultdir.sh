#!/bin/bash

default_dir_func() {
    DEFAULTDIR=$(zenity --file-selection --directory \ 
    --title="$CHOOSE_IMAGE_DIRECTORY" --window-icon=/usr/share/icons/hicolor/16x16/apps/PowerISO.png )
    sed -i 's/^DEFAU.*//g' ~/.config/poweriso.conf
    echo "DEFAULTDIR=$DEFAULTDIR" >> ~/.config/poweriso.conf
}
