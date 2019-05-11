# nordvpn-r7800
Change vpn server menu for r7800 router by selecting the country from a pull down menu <br>
installation<br>
1 enable telnet<br>
2 create dir /etc/openvpn/config/client<br>
3 put nord vpn credentials in /etc/openvpn/config/client/nordvpn.auth<br>
username@domain.com<br>
password<br>
4 copy files nvpn-addon.cgi and nvpn.addon.sh to /www/cgi-bin<br>
5 copy nvpn-addon.html in /www , or replace /www/license.htm with this so you can use<br>
the gnu license link in the webinterface to acces the vpn addon<br>
