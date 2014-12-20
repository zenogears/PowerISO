#!/bin/bash

iso_extract_func() {
    FILENAME=$(basename "$FILEISO" |awk -F"." '{print $1}')
    mkdir "$DIRNEWISO"/"$FILENAME"
    poweriso extract "$FILEISO" / -od "$DIRNEWISO"/"$FILENAME"| tee >(zenity --progress \
    --text="$PROGRESSBAR" --pulsate --auto-close --window-icon=/usr/share/icons/hicolor/16x16/apps/PowerISO.png )
    zenity --info --title "$NORTIFICATION" --text "$COMPLETED" --window-icon=/usr/share/icons/hicolor/16x16/apps/PowerISO.png 
}