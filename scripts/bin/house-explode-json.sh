#!/bin/bash

if [ $# -ne "1" ]
then
  echo ""
  echo "explode json"
  echo ""
  echo "Usage:"
  echo ""
  echo "       $0 \"[f]\""
  echo ""
  echo "       [f] - json filename"
  echo ""
  exit 86
fi


file=$1
file_tmp=tmp.json
cat $file | sed -e $'s/,/,\\\n/g' > $file_tmp
mv $file_tmp $file

