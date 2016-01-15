# Memory Utlilty
# This Utility has been authored by Trevor Fernandes a.k.a TBF
# Version 1.0
# Simple Utility to display memory usage of engine process 
###############################################################

reset
while [ 2 -le 2 ] 
do
    echo "############# Memory Utility 1.0 TBF ###############"
    value=$(cat /proc/`ps -e | grep -w 'engine$' | awk '{ print $1 }'`/status 2>/tmp/sample.log | grep VmRSS)
    value=$(awk '{ print $2 }' <<< "$value")
    if [ "$value" = "" ]; then
	echo ""
	echo -e "\e[1;41m>>\e[0m No Interactive running."
	echo ""
	echo "####################################################"
    else
	echo ""		
        echo -e "Interactive Memory Usage: \e[1;42m$value KBs\e[0m"
	echo ""
	echo "####################################################"
    fi;
    sleep 3
    reset
done
