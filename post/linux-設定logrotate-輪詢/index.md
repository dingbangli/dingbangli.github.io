# Linux - 設定 logrotate 輪詢


***
***

### 建立 `logrotate` 目錄

```sql
mkdir /root/logrotate/
```

***
***

### 建立 `執行的 shell` 

{{< admonition example >}}

`(加入參數 -f 為強制執行)`

EX:

/usr/sbin/logrotate  -f /root/logrotate/weblog

{{< /admonition >}}
    
```sql
vim /root/logrotate/logrotate.sh
```
    
```sql
#!/bin/bash

/usr/sbin/logrotate  /root/logrotate/weblog
```

***
***
     
### 建立要輪詢的設定檔

```sql
vim /root/logrotate/weblog
```
    
```sql

/usr/local/web/nginx/logs/*.acc {
        daily
        rotate 3
        create
        sharedscripts
        postrotate
             /usr/local/web/nginx/sbin/nginx -s reload
        endscript
    }   
```
    
***
***
    
### 建立排程

```sql
crontab -e
```
    
```sql
 10 05 * * * sh /root/logrotate/logrotate.sh
```

***
***

| 參數 | 說明 |
| --- | --- |
| daily | 表示每日一份 |
| create | 輪替之後，自動建立新的記錄檔 |
| minsize | 大小超過100k，才會發生滾動，即使時間沒到下一個滾動週期內，也不會發生滾動 |
| maxsize | 大小超過100k，即使時間沒到下一個滾動週期內，也會發生滾動 |
| dateext | %Y%m%d作為字尾 |
| rotate 5 | 保留最近的5個備份 |
| compress | 切換之後壓縮.tar.gz |
| create 644 root root | 權限壓644 root |
| sharedscripts | 整個日誌組執行一次 |
| postrotate | 在與 endscript 的區間內是 rotate 結束後會執行的指令 |
| endscript | 同上 |
| copytruncate | 用於還在打開中的日誌文件，把當前日誌備份並截斷 |
| missingok | 大小超過100k，才會發生滾動，即使時間沒到下一個滾動週期內，也不會發生滾動 |

***
***


| 參數 | 說明 |
| --- | --- |
| -d, --debug | debug 模式，測試配置文件是否有錯誤 |
| -f, --force | 強制轉儲文件 |
| -m, --mail=command | 壓縮日誌後，發送日誌到指定郵箱 |
| -s, --state=statefile | 使用指定的狀態文件 |
| -v, --verbose | 顯示轉儲過程 |

***
***


### 查看執行狀態
    
```sql
cat /var/lib/logrotate/logrotate.status
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
> URL: https://laurance.eu.org/posts/linux-%E8%A8%AD%E5%AE%9Alogrotate-%E8%BC%AA%E8%A9%A2/  

