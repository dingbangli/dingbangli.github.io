# Apache - 如何透過 rsyslog 服務同步寫 log


<!--more-->
"Apache 透過 rsyslog 同步寫 LOG 到其他台機器"

## 編輯 Apache 設定檔

```sql
vim /etc/httpd/conf/httpd.conf
```

{{< admonition >}}
    ErrorLogFormat "[%{u}t] [%-m:%l] [pid %P:tid %T] %7F: %E: [client\ %a] %M% ,\ referer\ %{Referer}i"
    <IfModule logio_module>
    LogFormat "%h %l %u %t \"%r\" %>s %O %I %T %b \"%{Referer}i\" \"%{User-Agent}i\"" nreporter
    </IfModule>
    CustomLog "logs/access-NReporter_log" nreporter
{{< /admonition >}}

## 重啟 Apache 服務和確認 Apache 服務狀態
    
```sql
systemctl restart httpd && systemctl status httpd
```
    
## 編輯 rsyslog 設定檔
    
```sql
vim /etc/rsyslog.conf
```    
    
{{< admonition >}}   
    ###MODULES###
    $ModLoad imfile # provides support for file logging
    # Send Apache log to N-Reporter
    input(type="imfile" File="/var/log/httpd/access-NReporter_log" Tag="apache" Severity="info" Facility="local6"
    Ruleset="nreporter")
    input(type="imfile" File="/var/log/httpd/error_log" Tag="apache" Severity="warning" Facility="local6"
    Ruleset="nreporter")
    ruleset(name="nreporter"){action(type="omfwd" Target="192.168.2.69" Port="514" Protocol="udp")}
{{< /admonition >}}

## 重啟 Rsyslog 服務和確認 Rsyslog 服務正常
    
```sql
systemctl restart rsyslog && systemctl status rsyslog
```


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
> URL: https://laurance.eu.org/posts/apache-%E9%80%8F%E9%81%8Ersyslog%E5%90%8C%E6%AD%A5log/  

