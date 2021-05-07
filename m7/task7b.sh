#!/usr/bin/bash
function mrip {
    #From which ip were the most requests?
    cat $1  | awk '{print $1}' | sort | uniq -c | sort -n | tail --lines=1
}

function mrpage {
    #What is the most requested page?
    cat $1  | awk {'print $7'} | sort | uniq -c | sort -n | tail --lines=1
}

function qrip {
    #How many requests were there from each ip?
    cat $1   | awk '{print $1}' | sort | uniq -c | sort -n 
}

function nepage {
    #What non-existent pages were clients referred to?
    awk '($9 ~ /404/)' $1  | awk '{print $9,$11}' | sort
}

function tmr {
     #What time did site get the most requests?
     cat $1  | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $1":"$2":"$3":"4}' | sort -nk1 -nk2 | uniq -c | tail --lines=1
}

function sbot {
    #What search bots have accessed the site? (UA + IP)
    awk -F\" '($6 ~ /\S+bot/) {print $6, $1  }' $1   | awk -F\- '{print $1}'
}

if [ -n "$1" ]
then
   echo "How many requests were there from each ip?"
   mrip $1
   echo "What is the most requested page?"
   mrpage $1
   echo "How many requests were there from each ip?"
   qrip $1
   echo "What non-existent pages were clients referred to?"
   nepage $1
   echo "What time did site get the most requests?"
   tmr $1
   echo "What search bots have accessed the site? (UA + IP)"
   sbot $1
else
  
    echo "No parameters found. "  
    exit 1
fi

