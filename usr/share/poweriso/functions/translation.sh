#!/bin/bash

if [ -f $(cat ~/.config/poweriso.conf|grep "RU") ];
than
. /usr/share/poweriso/translations/russian
else
. /usr/share/poweriso/translations/english
fi