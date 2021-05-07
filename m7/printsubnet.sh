#!bin/bash
printsubnet(){
    local OLDIFS="$IFS"
	local SUB=${1/\/*/}
	local MASK=$(( 1 << ( 32 - ${1/*\//} )))
	
	IFS="."
	    set --$SUB
		IPS=$((0x$(printf "%02x%02x%02x%02x\n" $1 $2 $3 $4)))
	IFS="$OLDIFS"
	
	for ((N=0; N<MASK; N++))
	{
	    VAL=$((IPS|N))
		printf "%d.%d.%d.%d\n"
		$(( VAL >> 24) & 255 ))
		$(( VAL >> 16) & 255 ))
		$(( VAL >> 8)  & 255 ))
		$(( VAL )      & 255 ))
	}
}

printsubnet 172.16.0.0/16

#regexp for python

(?P<ip>.*?) (?P<remote_log_name>.*?) (?P<userid>.*?) \[(?P<date>.*?)(?= ) (?P<timezone>.*?)\] \"(?P<request_method>.*?) (?P<path>.*?)(?P<request_version> HTTP/.*)?\" (?P<status>.*?) (?P<length>.*?) \"(?P<referrer>.*?)\" \"(?P<user_agent>.*?)\" (?P<session_id>.*?) (?P<generation_time_micro>.*?) (?P<virtual_host>.*)
	
	
	
(\S+) \S+ (\S+) \[([^\\]]+)\] "([A-Z]+) ([^ "]+)? HTTP\/[0-9.]+" ([0-9]{3}) ([0-9]+|-) "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"	


(?P<client>\S+) \S+ (?<userid>\S+) \[(?<datetime>[^\]]+)\] (?<method>[A-Z]+) (?<request>[^ "]+)? HTTP\/[0-9]+" (?<status>[0-9]{3}) (?<size>[0-9]+|-) "(?<referrer>[^"]*)" (?<useragent>[^"]*)"


^(\S+) \S+ \S+ \[([^\]]+)\] "([A-Z]+)[^"]*" \d+ \d+ "[^"]*" "([^"]*)"$ #it's work!!!!!!!!


^([^ ]+) ([^ ]+) ([^ ]+) (\[[^\]]+\]) "(.*) (.*) (.*)" ([0-9\-]+) ([0-9\-]+) "(.*)" "(.*)"$


my ($ip, $date, $method, $url, $protocol, $alt_url, $code, $bytes,
        $referrer, $ua) = (m/
    ^(\S+)\s                    # IP
    \S+\s+                      # remote logname
    (?:\S+\s+)+                 # remote user
    \[([^]]+)\]\s               # date
    "(\S*)\s?                   # method
    (?:((?:[^"]*(?:\\")?)*)\s   # URL
    ([^"]*)"\s|                 # protocol
    ((?:[^"]*(?:\\")?)*)"\s)    # or, possibly URL with no protocol
    (\S+)\s                     # status code
    (\S+)\s                     # bytes
    "((?:[^"]*(?:\\")?)*)"\s    # referrer
    "(.*)"$                     # user agent
/x);
die "Couldn't match $_" unless $ip;
$alt_url ||= '';
$url ||= $alt_url;






grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" logfile | sort -n | uniq -c | sort -n

cut -f 3 log | uniq -c | sort -n

cut -f 8 log | uniq -c | sort -n

or IP counts in an access log:

cat log | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" | sort -n | uniq -c | sort -n

netstat -an | awk '{print $5}' | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" | egrep -v "(`for i in \`ip addr | grep inet |grep eth0 | cut -d/ -f1 | awk '{print $2}'\`;do echo -n "$i|"| sed 's/\./\\\./g;';done`127\.|0\.0\.0)" | sort -n | uniq -c | sort -n

#!/bin/bash
# Usage
# ls-httpd type count
# Eg: 
# ls-httpd url 1000
# will find top URLs in the last 1000 access log entries
# ls-httpd ip 1000
# will find top IPs in the last 1000 access log entries
# ls-httpd agent 1000
# will find top user agents in the last 1000 access log entries

type=$1
length=$2

if [ "$3" == "" ]; then
  log_file="/var/log/httpd/example.com-access_log"
else
  log_file="$3"
fi

if [ "$type" = "ip" ]; then
  tail -n $length $log_file | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" | sort -n | uniq -c | sort -n
elif [ "$type" = "agent" ]; then
  tail -n $length $log_file | awk -F\" '{print $6}'| sort -n | uniq -c | sort -n
elif [ "$type" = "url" ]; then
  tail -n $length $log_file | awk -F\" '{print $2}'| sort -n | uniq -c | sort -n
fi


cat access.log | awk '{print $1}' | sort | uniq -c |sort -n

request per hour
cat access.log | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":00"}' | sort -n | uniq -c

request per hour by date
grep "23/Jan" access.log | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":00"}' | sort -n | uniq -c

request per hour by IP
grep "XX.XX.XX.XX" access.log | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":00"}' | sort -n | uniq -c

requests per minute:
cat access.log | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":"$3}' | sort -nk1 -nk2 | uniq -c

requests per minute for date:
grep "02/Nov/2017" access.log | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":"$3}' | sort -nk1 -nk2 | uniq -c

requests per minute for url:
grep "[url]" access.log | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":"$3}' | sort -nk1 -nk2 | uniq -c

per IP per minute
grep "XX.XX.XX.XX" access.log | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":"$3}' | sort -nk1 -nk2 | uniq -c

hopes it will help anyone who's looking for it...