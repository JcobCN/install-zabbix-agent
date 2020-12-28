if [ ! $1 ]; then
	echo "参数1为空，则默认为 192.169.0.125"
	IP=192.169.0.125
else
	IP=$1
fi

apt install zabbix-agent
sed -i "s/^Server=127.0.0.1/Server=$IP/g" /etc/zabbix/zabbix_agentd.conf
sleep 2
service zabbix-agent restart
