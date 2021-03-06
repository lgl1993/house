#!/bin/bash
# ---------------------------------------------------------------------------------------------------|
#  School / Organization   : bradyhouse.io___________________________________________________________|
#  Specification           : N/A_____________________________________________________________________|
#  Specification Path      : N/A_____________________________________________________________________|
#  Author                  : brady house_____________________________________________________________|
#  Create date             : 03/19/2015______________________________________________________________|
#  Description             : ENTRY POINT FOR ALL FIDDLE-*.SH SCRIPTS_________________________________|
#  Command line Arguments  : $1 = COMMAND TYPE - "create", $2, $3 ..  = REQUIRED ARGUMENTS___________|
# ---------------------------------------------------------------------------------------------------|
#  Revision History::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::|
# ---------------------------------------------------------------------------------------------------|
# Baseline Ver.
# 05/01/2015 - See CHANGELOG @ 201505011810
# 05/03/2015 - See CHANGELOG @ 201505310420
# 06/21/2015 - See CHANGELOG @ 201506210420
# 09/10/2015 - See CHANGELOG @ 201508240420
# 09/23/2015 - See CHANGELOG @ 201509220420
# ---------------------------------------------------------------------------------------------------|
clear
port=8889
thisFile=$(echo "$0" | sed 's/\.\///g')

function showTitle() {
    echo -e ""
    echo -e "H o u s e"
    echo -e "oooooooooooo  o8o        .o8        .o8  oooo    "
    echo -e " 888       8  \`\"'        888        888   888   "
    echo -e " 888         oooo   .oooo888   .oooo888   888   .ooooo."
    echo -e " 888oooo8     888  d88   888  d88   888   888  d88   88b"
    echo -e " 888          888  888   888  888   888   888  888ooo888"
    echo -e " 888          888  888   888  888   888   888  888    .o "
    echo -e "o888o        o888o  Y8bod88P   Y8bod88P  o888o  Y8bod8P "
    echo -e ""
    echo "$1" | awk '{print toupper($0)}'
}

#try
(
    showTitle "${thisFile}"
    if [ "$#" -lt 1 ]; then  exit 86; fi
    case $1 in
        'combine')
            case "$#" in
                1 | 2)
                    ./fiddle-combine.sh; exit 0;
                    ;;
                3)
                    ./fiddle-combine.sh $2 $3;
                    ;;
                4)
                    ./fiddle-combine.sh $2 $3 $4;
                    ;;
                *)
                    ./fiddle-combine.sh $2 $3 $4 $5;
                    ;;
            esac
            ;;
        'create')
            if [ "$#" -lt 3 ]; then  ./fiddle-create.sh;  exit 0; fi
            ./fiddle-create.sh $2 $3
            ;;
        'fork')
            if [ "$#" -lt 4 ]; then  ./fiddle-fork.sh;  exit 0; fi
            ./fiddle-fork.sh $2 $3 $4
            ;;
        'index')
            if [ "$#" -lt 2 ]; then  ./fiddle-index.sh;  exit 0; fi
            ./fiddle-index.sh $2
            ;;
        'start')
            if [ "$#" -lt 2 ]; then  ./fiddle-start.sh;  exit 0; fi
            if [ "$#" -eq 3 ]; then port=$3; fi
            ./fiddle-start.sh  $2 ${port}
            ;;
        'stop')
            if [ "$#" -eq 2 ]; then port=$2; fi
            ./fiddle-stop.sh ${port}
            ;;
        'delete')
            if [ "$#" -lt 3 ]; then  ./fiddle-delete.sh;  exit 0; fi
            ./fiddle-delete.sh $2 $3
            ;;
        'refactor')
            if [ "$#" -lt 4 ]; then  ./fiddle-refactor.sh;  exit 0; fi
            ./fiddle-refactor.sh $2 $3 $4;
            ;;
        'test')
            if [ "$#" -lt 3 ]; then  ./fiddle-test.sh;  exit 0; fi
            ./fiddle-test.sh $2 $3;
            ;;
        'list')
            if [ "$#" -lt 2 ]; then  ./fiddle-list.sh;  exit 0; fi
            ./fiddle-list.sh $2;
            ;;
        *)  exit 86
            ;;
    esac
)
#catch
_rc=$?
case ${_rc} in
    0)  echo ""
        ;;
    86) echo ""
        echo "Nope ~ Incorrect number of arguments"
        echo ""
        echo "Usage:"
        echo ""
        echo "$0 \"[c]\" \"[a1]\" \"[a2]\" \"[a3]\""
        echo ""
        echo -e "[c]\tcommand. Valid types include: "
        echo ""
        echo -e "\t\"create\"\tCreate a new fiddle"
        echo -e "\t\"combine\"\tCombine src files into an app.js file"
        echo -e "\t\"fork\"\t\tFork an existing fiddle"
        echo -e "\t\"index\"\t\tRe-index a specific fiddle type"
        echo -e "\t\"list\"\t\tList the fiddles defined for a specific type"
        echo -e "\t\"start\"\t\tStart the fiddle web service process"
        echo -e "\t\"stop\"\t\tStop the web service process"
        echo -e "\t\"delete\"\tDelete an existing fiddle"
        echo -e "\t\"refactor\"\tRename (\"refactor\") an existing fiddle"
        echo -e "\t\"test\"\t\tInvoke JsTestDriver for a given fiddle"
        echo ""
        echo -e "[a1-3]\targuments. The arguments required by the "
        echo -e "\tspecified command. There can be up to 3 arguments."
        echo -e "\tTo understand the arguments required by a specific"
        echo -e "\tcommand execute the command with no additional"
        echo -e "\tparameters."
        echo ""
        ;;
    *)  echo "fubar! Something went wrong."
        ;;
esac
#finally
exit ${_rc}
