#!/bin/bash
function fall{
    echo
}

function ftarget{
    echo 
}




echo script name is $0
if ["$#" =="0"] 
then
    echo "Script must have one parameter:"
	echo "the --all key displays the IP addresses and symbolic names of all hosts in the current subnet 
"
	echo "the --target key displays a list of open system TCP ports"
	exit 1
else
    while getopts ":all :target"
	do
	case $option in
	all)
	    echo received -all ;;
    target)
        echo received -target ;;
    *)
        echo "invalid option -$OPTARG" ;;	
	esac
	done
fi

