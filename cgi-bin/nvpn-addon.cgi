#!/bin/sh
echo "Content-type: text/html"
echo ""
COUNTRY=$(echo ${QUERY_STRING##*=})
if  [ ! -n "$COUNTRY"  ] 
then 
echo $(cgi-bin/nvpn-addon.sh)
else
echo Changed server to recommended server 
echo restarting...
echo $(cgi-bin/nvpn-addon.sh $COUNTRY)
fi
