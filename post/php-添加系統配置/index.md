# PHP - 添加到系統啟動 systemctl


***
***

**Centos7 配置 systemctl-php-fpm 服務**
=====

***
***

**增加 `php-fpm` 的 `pid 設定檔`**

```sql
vim /usr/local/php/etc/php-fpm.conf
```

```sql
; Pid file
; Note: the default prefix is /usr/local/php/var
; Default Value: none
pid = /var/run/php-fpm.pid
```

***
***

**新增 `php-fpm` 系統服務**

```sql
touch /usr/lib/systemd/system/php-fpm.service
```

***
***

**編輯 `php-fpm` 系統服務設定**

```sql
vim /usr/lib/systemd/system/php-fpm.service
```

```sql
[Unit]
Description=The PHP FastCGI Process Manager
After=syslog.target network.target

[Service]
Type=forking
PIDFile=/var/run/php-fpm.pid
ExecStart=/usr/local/php/sbin/php-fpm
ExecReload=/bin/kill -USR2 $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```

***
***

**重啟系統管理配置服務**

```sql
systemctl daemon-reload
```

***
***

**啟動服務 `php-fpm`**

```sql
systemctl start php-fpm
```

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
> URL: https://laurance.eu.org/posts/php-%E6%B7%BB%E5%8A%A0%E7%B3%BB%E7%B5%B1%E9%85%8D%E7%BD%AE/  

