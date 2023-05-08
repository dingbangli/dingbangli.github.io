# Docker - 建立 Zabbix 分散式監控 語法紀錄


{{< admonition >}}

# 建立 Namesppace >> zabbix-net
    
```sql

docker network create --subnet 172.20.0.0/16 --ip-range 172.20.240.0/20 zabbix-net

```

{{< /admonition >}}

{{< admonition >}}
   
# 建立 docker 容器工作目錄
    
```sql

mkdir -p /usr/local/docker/mysql

```

{{< /admonition >}}

{{< admonition >}}
    
# 建立 mysql 容器

```sql

docker run --name mysql-server --hostname=mysql-server -t \
          -e MYSQL_DATABASE="zabbix" \
          -e MYSQL_USER="zabbix" \
          -e MYSQL_PASSWORD="zabbix" \
          -e MYSQL_ROOT_PASSWORD="123456" \
          --network=zabbix-net \
          -v /usr/local/docker/mysql:/var/lib/mysql \
          -v /etc/localtime:/etc/localtime \
          -d mysql:5.7

```

{{< /admonition >}}

{{< admonition >}}
    	 
# 建立 zabbix-server-mysql 容器
    
```sql

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

```

{{< /admonition >}}

{{< admonition >}}
 
# 建立前端 zabbix-web-nginx-mysql容器
    
```sql

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

```

{{< /admonition >}}

{{< admonition >}}
    
# 建立Client端的控制元件
    
```sql

docker run --name some-zabbix-agent --hostname=some-zabbix-agent \
    	   -e ZBX_HOSTNAME="zabbix-server-agent" \
    	   -e ZBX_SERVER_HOST="zabbix-server-mysql" \
           -e ZBX_METADATA="zabbix-server-agent" \
    	   --network=zabbix-net \
    	   --restart=always \
    	   -p 10050:10050 \
    	   -d zabbix/zabbix-agent

```

{{< /admonition >}}

{{< admonition >}}

## 登入檢測 預設:
    
## 賬號：Admin   密碼：zabbix
    
```sql

Configuration > Hosts > Create host 
    
    > Host name : some-zabbix-agent
    > Groups : Linux servers
    > IP : 172.20.240.4
    > Port : 10050

```

{{< /admonition >}}


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


---

> Author: Laurance  
> URL: https://laurance.eu.org/posts/docker-%E5%BB%BA%E7%AB%8Bzabbix%E5%88%86%E6%95%A3%E5%BC%8F%E7%9B%A3%E6%8E%A7/  

