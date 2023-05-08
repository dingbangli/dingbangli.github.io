# Linux - Logrotate 參數


***
***

`daily` **指定轉儲週期爲每天**

***
***

`weekly` **指定轉儲週期爲每週**

***
***

`monthly` **指定轉儲週期爲每月**

***
***

`rotate count` **指定日誌文件刪除之前轉儲的次數，0 指沒有備份，5 指保留 5 個備份**

***
***

`tabooext [+] list` **讓 logrotate 不轉儲指定擴展名的文件，缺省的擴展名是：.rpm-orig, .rpmsave, v, 和 ～**

***
***

`missingok` **在日誌輪循期間，任何錯誤將被忽略，例如 “文件無法找到” 之類的錯誤。**

***
***

`size size` **當日志文件到達指定的大小時才轉儲，bytes (缺省) 及 KB (sizek) 或 MB (sizem)**

***
***

`compress` **通過 gzip 壓縮轉儲以後的日誌**

***
***

`nocompress` **不壓縮**

***
***

`copytruncate` **用於還在打開中的日誌文件，把當前日誌備份並截斷**

***
***

`nocopytruncate` **備份日誌文件但是不截斷**

***
***

`create mode owner group`  **轉儲文件，使用指定的文件模式創建新的日誌文件**

***
***

`nocreate` **不建立新的日誌文件**

***
***

`delaycompress` **和 compress 一起使用時，轉儲的日誌文件到下一次轉儲時才壓縮**

***
***

`nodelaycompress` **覆蓋 delaycompress 選項，轉儲同時壓縮。**

***
***

`errors address`  **專儲時的錯誤信息發送到指定的 Email 地址**

***
***

`ifempty` **即使是空文件也轉儲，這個是 logrotate 的缺省選項。**

***
***

`notifempty` **如果是空文件的話，不轉儲**

***
***

`mail address`  **把轉儲的日誌文件發送到指定的 E-mail 地址**

***
***

`nomail`  **轉儲時不發送日誌文件**

***
***

`olddir directory` **儲後的日誌文件放入指定的目錄，必須和當前日誌文件在同一個文件系統**

***
***

`noolddir` **轉儲後的日誌文件和當前日誌文件放在同一個目錄下**

***
***

`prerotate/endscript` **在轉儲以前需要執行的命令可以放入這個對，這兩個關鍵字必須單獨成行**

***
***

{{< admonition example >}}

**Log 保留三天 , 執行完畢 , Nginx 重啟**

{{< /admonition >}}
    
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
> URL: https://laurance.eu.org/posts/linux-logrotate-%E5%8F%83%E6%95%B8/  

