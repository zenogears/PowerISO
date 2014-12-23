#!/bin/bash

if [ -f $(cat ~/.config/poweriso.conf|grep "RU") ];
then
. /usr/share/poweriso/translations/russian
else
. /usr/share/poweriso/translations/english
fi