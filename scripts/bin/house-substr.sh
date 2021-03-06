#!/bin/bash

if [ $# -ne "3" ]
then
  echo ""
  echo "sub string"
  echo ""
  echo "Usage: `basename $0` old-pattern new-pattern filename"
  exit 86
fi

if [ -f "$3" ]
then
    _f=$3
else
    echo "File \"$3\" does not exist."
    exit 86
fi

_s=$(echo $1 | sed -e 's/[]\/$*.^|[]/\\&/g')
_g=$(echo $2 | sed -e 's/[]\/$*.^|[]/\\&/g')
_tmp=$(echo "$3.tmp")

sed -e "s/$_s/$_g/g" $_f > $_tmp

sudo mv -f $_tmp $_f

if [ -f $_tmp ]
then
   rm -R $_tmp
fi

exit $?
