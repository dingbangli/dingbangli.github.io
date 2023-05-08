+++
author = "Hugo Authors"
title = "Docker-建立Zabbix分散式監控"
date = "2022-08-03"
#description = ""
categories = [
    "Docker"
]
tags = [
    "Zabbix",
]
image = "100.png"
+++



    建立Namesppace >> zabbix-net
    docker network create --subnet 172.20.0.0/16 --ip-range 172.20.240.0/20 zabbix-net
    
    建立docker容器工作目錄
    mkdir -p /usr/local/docker/mysql
    
    建立mysql容器
    docker run --name mysql-server --hostname=mysql-server -t \
          -e MYSQL_DATABASE="zabbix" \
          -e MYSQL_USER="zabbix" \
          -e MYSQL_PASSWORD="zabbix" \
          -e MYSQL_ROOT_PASSWORD="123456" \
          --network=zabbix-net \
          -v /usr/local/docker/mysql:/var/lib/mysql \
          -v /etc/localtime:/etc/localtime \
          -d mysql:5.7
    	 
    建立zabbix-server-mysql容器
    docker run --name zabbix-server-mysql --hostname=zabbix-server-mysql -t \
          -e DB_SERVER_HOST="mysql-server" \
          -e MYSQL_DATABASE="zabbix" \
          -e MYSQL_USER="zabbix" \
          -e MYSQL_PASSWORD="zabbix" \
          -e MYSQL_ROOT_PASSWORD="123456" \
          --network=zabbix-net \
          --link mysql-server:mysql \
          -p 10051:10051 \
          -d zabbix/zabbix-server-mysql:alpine-4.0.24
    
    建立前端 zabbix-web-nginx-mysql容器
    docker run --name zabbix-web-nginx-mysql --hostname=zabbix-web-nginx-mysql -t \
          -e DB_SERVER_HOST="mysql-server" \
          -e MYSQL_DATABASE="zabbix" \
          -e MYSQL_USER="zabbix" \
          -e MYSQL_PASSWORD="zabbix" \
          -e MYSQL_ROOT_PASSWORD="123456" \
          --network=zabbix-net \
          --link mysql-server:mysql \
          --link zabbix-server-mysql:zabbix-server \
          -p 85:8080 \
          -d zabbix/zabbix-web-nginx-mysql:alpine-4.0.24
    	
    建立Client端的控制元件
    docker run --name some-zabbix-agent --hostname=some-zabbix-agent \
    	   -e ZBX_HOSTNAME="zabbix-server-agent" \
    	   -e ZBX_SERVER_HOST="zabbix-server-mysql" \
           -e ZBX_METADATA="zabbix-server-agent" \
    	   --network=zabbix-net \
    	   --restart=always \
    	   -p 10050:10050 \
    	   -d zabbix/zabbix-agent
    	   
    登入檢測 預設:
    賬號：Admin   密碼：zabbix
    
    Configuration > Hosts > Create host 
    > Host name : some-zabbix-agent
    > Groups : Linux servers
    > IP : 172.20.240.4
    > Port : 10050



***

{{< css.inline >}}
<style>
.emojify {
	font-family: Apple Color Emoji, Segoe UI Emoji, NotoColorEmoji, Segoe UI Symbol, Android Emoji, EmojiSymbols;
	font-size: 2rem;
	vertical-align: middle;
}
@media screen and (max-width:650px) {
  .nowrap {
    display: block;
    margin: 25px 0;
  }
}
</style>
{{< /css.inline >}}
