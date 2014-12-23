#!/bin/bash

if [ -f $(cat ~/.config/poweriso.conf|grep "RU") ];
then
. /usr/share/poweriso/translations/english
else
. /usr/share/poweriso/translations/russian
fi