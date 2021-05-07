#!/usr/bin/bash



function ftarget {
    nmap $1

}

function fall {
    unset arr
    arr=(`nmap -sn $1 | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"`)
    for i in "${arr[@]}"; do echo "$i, `host $i`"; done

}




if [ $# -lt 1 ]
then
echo "No options found!"
echo "Script must have  one parameter:"
echo "the -all key displays the IP addresses and symbolic names of all hosts in the current subnet"
echo "the -target key displays a list of open system TCP ports" 
exit 1
fi

re="\b([0-9]{1,3}\.){3}[0-9]{1,3}\/2[4-9]\b"


while :; do
    case $1 in
    --all)
         
             if [[ $2 =~ $re ]] ; then 
                 fall $2
             else
                echo "Wrong argument found!"
                exit 1 
             fi
         
         ;;
     --target)
         
             if [[ $2 =~ $re ]] ; then 
                 ftarget $2
             else
                echo "Wrong argument found!"
                exit 1 
             fi
         
         ;;
       *)
            break
         esac 
         shift
done






