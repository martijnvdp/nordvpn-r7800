if [ ! -n "$1" ]
then
curl --silent https://nordvpn.com/wp-admin/admin-ajax.php?action=servers_countries
else
/etc/init.d/openvpn-client stop
/etc/init.d/dnscrypt-proxy-2 stop
fi
if [ $1 != "stop" ]
then
server="$(curl --silent 'https://nordvpn.com/wp-admin/admin-ajax.php?action=servers_recommendations&filters=\{%22country_id%22:'$1'\}' | jq --raw-output 'limit(1;.[])|.hostname')"
wget -O /etc/openvpn/config/client/nordvpn.ovpn https://downloads.nordcdn.com/configs/files/ovpn_legacy/servers/$server.udp1194.ovpn
sed -i 's/auth-user-pass/auth-user-pass nordvpn.auth/g' /etc/openvpn/config/client/nordvpn.ovpn
echo "nice -20" >> /etc/openvpn/config/client/nordvpn.ovpn
echo "sndbuf 393216" >> /etc/openvpn/config/client/nordvpn.ovpn
echo "rcvbuf 393216" >> /etc/openvpn/config/client/nordvpn.ovpn
echo push \"rcvbuf 393216\" >> /etc/openvpn/config/client/nordvpn.ovpn
echo push \"sndbuf 393216\" >> /etc/openvpn/config/client/nordvpn.ovpn
sed -i 's/mssfix 1450/mssfix 1460/g' /etc/openvpn/config/client/nordvpn.ovpn
/etc/init.d/openvpn-client start
/etc/init.d/dnscrypt-proxy-2 start
fi
