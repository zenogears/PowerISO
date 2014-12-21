#!/bin/bash

options_module_funk() {
OPTSMODULE="Options"

          while [ "$OPTSMODULE" != "" ]
          do 
          OPTSMODULE=$(zenity --list --radiolist --width=350 --height=250 --window-icon=/usr/share/icons/hicolor/16x16/apps/PowerISO.png \
             --column="" --column="$CHOOSE_ACTION" \
             "" "$LANGG"\
             "" "$BACK" )

          case $OPTSMODULE in

            "$BACK")
               break
            ;;
    
           "Change language (Need restart)" )
               sed -i 's/EN/RU/g' ~/.config/poweriso.conf
               . /usr/share/poweriso/translations/russian
               break
            ;;
    
            "Сменить язык (Нужен перезапуск)" )
                sed -i 's/RU/EN/g' ~/.config/poweriso.conf
                . /usr/share/poweriso/translations/english
                break
            ;;
           esac
done
}