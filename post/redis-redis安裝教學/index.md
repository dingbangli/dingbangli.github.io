# Redis - 安裝及配置教學


***
***

[Index of redis 載點](http://download.redis.io/releases/)

***
***

**下載完成後解壓**

```sql
tar zxvf redis-4.0.6.tar.gz
    
cd /root/redis-4.0.6
    
make MALLOC=libc
    
make PREFIX=/usr/local/redis install
```

***
***
           
**redis 設定檔配置**
   
```sql
mkdir /usr/local/redis/etc/
    
cp redis.conf /usr/local/redis/etc/
    
cd /usr/local/redis/bin/
    
cp redis-benchmark redis-cli redis-server /usr/bin/
```

***
***

**修改 redis 設定**
   
```sql
vim /usr/local/redis/etc/redis.conf
    
bind 0.0.0.0
    
daemonize yes
    
requirepass (password設置)
```

***
***
    
**redis ( 腳本 )** 

`ps. 若有改 port 或設置密碼 腳本也需要更改`
    
```sql
vim redis
```
   
```sql
#!/bin/bash
#chkconfig: 2345 80 90
# Simple Redis init.d script conceived to work on Linux systems
# as it does use of the /proc filesystem.

PATH=/usr/local/bin:/sbin:/usr/bin:/bin
REDISPORT=6379
EXEC=/usr/local/redis/bin/redis-server
REDIS_CLI=/usr/local/redis/bin/redis-cli

PIDFILE=/var/run/redis_6379.pid
CONF="/usr/local/redis/etc/redis.conf"
#PW=(password)

case "$1" in
start)
if [ -f $PIDFILE ]
then
echo "$PIDFILE exists, process is already running or crashed"
else
echo "Starting Redis server..."
$EXEC $CONF
fi
if [ "$?"="0" ]
then
echo "Redis is running..."
fi
;;
stop)
if [ ! -f $PIDFILE ]
then
echo "$PIDFILE does not exist, process is not running"
else
PID=$(cat $PIDFILE)
echo "Stopping ..."
#$REDIS_CLI -p -a (password) $REDISPORT --no-auth-warning SHUTDOWN
$REDIS_CLI -p  $REDISPORT SHUTDOWN
while [ -x ${PIDFILE} ]
do
echo "Waiting for Redis to shutdown ..."
sleep 1
done
echo "Redis stopped"
fi
;;
restart|force-reload)
${0} stop
${0} start
;;
*)
echo "Usage: /etc/init.d/redis {start|stop|restart|force-reload}" >&2
exit 1
esac
```

***
***
    
**複製腳本至啟動檔位置,並給予權限**
   
```sql
cp redis /etc/init.d/
    
chmod 755 /etc/init.d/redis
```

***
***
    
**添加至開機啟動 (centos 6)**
   
```sql
chkconfig --add redis
    
chkconfig --level 2345 redis on
    
chkconfig --list |grep redis
```

***
***
    
**添加至開機啟動 (centos 7)**
    
```yaml
systemctl enable redis
    
systemctl is-enabled redis   // 檢查 redis 是否設置為開機啟動
```    

***
***

**開啟服務**
   
```sql
service redis start
```

***
***

{{< admonition example >}}

**若出現 ERROR :**  
**“Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe”**

***
 
**加上參數即可: `--no-auth-warning`**

{{< /admonition >}}

***
***


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
> URL: https://laurance.eu.org/posts/redis-redis%E5%AE%89%E8%A3%9D%E6%95%99%E5%AD%B8/  

