#!/bin/bash

where_iso_file() {
    FILEISO=$(zenity --file-selection --filename="$DEFAULTDIR/" \
    --title="$CHOOSE_IMAGE" \
    --window-icon=/usr/share/icons/hicolor/16x16/apps/PowerISO.png )
    case $FILEISO in
        0) ;;
        "") continue;;
    esac
}

where_is_dir_for_iso() {
    DIRNEWISO=$(zenity --file-selection  --filename="$FILEISO" \
    --directory --title="$CHOOSE_DIRECTORY" \
    --window-icon=/usr/share/icons/hicolor/16x16/apps/PowerISO.png )
    case $DIRNEWISO in
        0) ;;
        "") continue;;
    esac
    DEFAULTDIR=$DIRNEWISO
}

try_to_convert() {
    FILENAME=$(basename "$FILEISO" |awk -F"." '{print $1}')
    zenity --question --title="$YESNO" \
    --text="$IMAGE\n $FILEISO\n $CONVERTED_IN\n $DIRNEWISO/$FILENAME.$DISKFORMAT" \
    --window-icon=/usr/share/icons/hicolor/16x16/apps/PowerISO.png
    if [ $? -eq "0" ]; then
        
        ##В идеале сделать проверку на файлы в директории. Иначе оно спрашивает удалять ли файлы в консоли.
        find "$DIRNEWISO" -name "$FILENAME.cue" -exec rm -rf {} \;
        find "$DIRNEWISO" -name "$FILENAME.bin" -exec rm -rf {} \;
        
        ## Конвертация с отрисовской. В идеале сделать с реальными %
        /usr/sbin/poweriso convert "$FILEISO" -o "$DIRNEWISO"/"$FILENAME"."$DISKFORMAT" \
        -ot "$DISKFORMAT"| tee >(zenity --progress --text="$PROGRESSBAR" --pulsate \
        --auto-close --window-icon=/usr/share/icons/hicolor/16x16/apps/PowerISO.png)
        
        zenity --info --title "$NORTIFICATION" --text="$COMPLETED" \
        --window-icon=/usr/share/icons/hicolor/16x16/apps/PowerISO.png 
    else
        continue
    fi
}
