#!/bin/bash

iso_format_func() {
ISOFORMAT=$(zenity --list --radiolist --height=310 \
    --window-icon=/usr/share/icons/hicolor/16x16/apps/PowerISO.png \
    --column="" --column="$CHOOSE_FORMAT" \
    "" "iso" \
    "" "bin" \
    "" "mdf" \
    "" "nrg" \
    "" "daa"\
    "" "img")
    case $ISOFORMAT in
        iso) DISKFORMAT="iso";;
        bin) DISKFORMAT="bin";;
        mdf) DISKFORMAT="mdf";;
        nrg) DISKFORMAT="nrg";;
        img) DISKFORMAT="img";;
        daa) DISKFORMAT="daa";;
        "") continue;;
        *) continue;;
    esac
}