+++
author = "Hugo Authors"
title = "Linux-設定logrotate 輪詢"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Logrotate",
]
image = "100.png"
+++


建立 `logrotate` 目錄

    mkdir /root/logrotate/

建立 shell
    
    vim /root/logrotate/logrotate.sh
    
```javascript
#!/bin/bash

/usr/sbin/logrotate -f /root/logrotate/weblog

```
     
建立要輪詢的設定檔

    vim /root/logrotate/weblog
    
```javascript

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
    
---
    
建立排程

    crontab -e
    
```javascript

 10 05 * * * sh /root/logrotate/logrotate.sh
 
```

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

---

| 參數 | 說明 |
| --- | --- |
| -d, --debug | debug 模式，測試配置文件是否有錯誤 |
| -f, --force | 強制轉儲文件 |
| -m, --mail=command | 壓縮日誌後，發送日誌到指定郵箱 |
| -s, --state=statefile | 使用指定的狀態文件 |
| -v, --verbose | 顯示轉儲過程 |

---

    查看執行狀態
    
    cat /var/lib/logrotate/logrotate.status


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
