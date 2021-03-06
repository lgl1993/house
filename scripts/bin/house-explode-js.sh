#!/bin/bash

if [ $# -ne "1" ]
then
  echo ""
  echo "explode js"
  echo ""
  echo "Usage:"
  echo ""
  echo "       $0 \"[f]\""
  echo ""
  echo "       [f] - js filename"
  echo ""
  exit 86
fi


file=$1
file_orig=$(echo "$file.orig")
file_tmp=tmp.json
cat $file > file_orig
cat $file | sed -e $'s/;/;\\\n/g' > $file_tmp
mv $file_tmp $file

