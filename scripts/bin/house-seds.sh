#!/bin/bash

if [ $# -ne "3" ]
then
  echo ""
  echo "sed substitute"
  echo ""
  echo "Usage:"
  echo "" 
  echo "       $0 [o] [t] [r]"
  echo ""
  echo "       [o] - Original string"
  echo "       [t] - Target value"
  echo "       [r] - Replacement value"
  echo ""
  exit 86
fi

_o=$(echo $1 | sed -e 's/[]\/$*.^|[]/\\&/g')
_t=$(echo $2)
_r=$(echo $3)

echo $_o | sed s/$_t/$_r/
