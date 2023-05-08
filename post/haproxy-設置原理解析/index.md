# haproxy - 設定檔解析


***
***

### global 設定 ( 全域設定 )

```sql
global
        log 127.0.0.1 local5
        chroot /usr/local/haproxy
        pidfile /var/run/haproxy.pid
        maxconn 5000
        user haproxy
        group haproxy
        daemon
        stats socket /etc/haproxy/haproxy.sock mode 600 level admin
        stats timeout 2m
#-----------------------------------------------------------------------------------------------
```

{{< admonition example >}}

`log`       設定至本機 syslog 預設位置 (級別為 local5 `notice`)

`chroot`    設定為 haproxy 主要運行位置

`pidfile`   設定為 haproxy 進程

`maxconn`   設定每個 haproxy 進程可以接受的最大併發連接數

`daemon`    設定為背景執行

{{< /admonition >}}

***
***

### default 設定 ( 設定能用來配置套用到 frontend、backend、listen 等配置 )

```sql
defaults
        mode tcp
        log global
        option httplog
        option dontlognull
        option log-health-checks
        retries 3
        timeout http-request 30s
        timeout queue 300s
        timeout connect 600s
        timeout client 10m
        timeout server 10m
        timeout http-keep-alive 30s
        timeout check 600s
        maxconn 4000
#-----------------------------------------------------------------------------------------------
```

{{< admonition example >}}

`mode`  指定了 HAProxy instance 所使用的通訊協定

`log`   指定 LOG 將寫入的位址 global 值參照了 global 一節中的 log 參數中所指定的 HAProxy instance

`option httplog`    能紀錄 HTTP session 的多種值，包括 HTTP 請求、session 狀態、連線數、來源位址、以及連線計數器等等

`option dontlognull`    停用了對 null 連線之記錄，表示 HAProxy 不會記錄未傳遞任何資料的連線

`option log-health-checks`  記錄健康檢查日誌

`retries`   指定了在無法第一次就連上時，真實伺服器會重試連線的次數

`timeout http-request`  http請求超時時間

`timeout queue`     排隊超時

`timeout connect`   設置成功連接到一臺服務器的最長等待時間，默認單位是毫秒

`timeout client`    設置連接客戶端發送數據時的成功連接最長等待時間，默認單位是毫秒

`timeout server`    設置服務器端迴應客戶度數據發送的最長等待時間，默認單位是毫秒

`timeout http-keep-alive `  設置長連接時間

`timeout check`     設置超時時間

`maxconn`       最大連接數

{{< /admonition >}}

***
***

### listen stats 設定 ( 監聽狀態 )

```sql
listen stats
        bind  XX:XX:XX:XX:8080 (內網IP)
        mode    http
        log     127.0.0.1 local0 err
        stats   uri     /hastats
        stats auth    admin:admin
        stats refresh 10s
        stats hide-version
        stats admin if TRUE
#-----------------------------------------------------------------------------------------------        
```

{{< admonition example >}}

`bind`  設定 IP , PORT

{{< /admonition >}}

***
***

### frontend 設定 ( 設定會配置伺服器聆聽來自用戶端連線請求的聆聽 socket )

```sql
frontend ha86
        bind *:3386
        mode tcp
        option tcplog
        default_backend mysqlha86

```

{{< admonition example >}}

`option tcplog`  允許記錄tcp連接的狀態和時間

{{< /admonition >}}

***
***

### backend 設定 ( 設定會指定真實伺服器的 IP 位址，以及負載平衡程式的排程演算法 )

```sql
backend mysqlha86
        balance leastconn
        server db86 XX:XX:XX:XX:3306 check port 3306 rise 1 fall 2 maxconn 2000 weight 100
#-----------------------------------------------------------------------------------------------        
```

{{< admonition example >}}

`balance`   指定負載平衡程式的排程演算法，此範例中使用的乃最少連線排程法 `leastconn`

`server`    指定了後端可以使用的伺服器 db86

`check`     設置定期「健康檢查」的伺服器，以確保伺服器的可用性

`rise 1`    表示 1 次檢查結果正確則認爲服務器可用

`fall 2`    表示檢測結果失敗 2 次則認爲服務器不可用

`weight`    權重

{{< /admonition >}}

***
***

**演算法說明**
-----

|  演算法名稱 		  |  設置參數   	 |  							 							說明  
|  --------   		  |  --------   	 |  ----------------------------------------------------------------------------------------------------------------------------------------------------------	|
|	  循環法		  |    roundrobin    |            將請求依序發給集區中的伺服器。使用此演算法則時，所有真實伺服器不管能力為何，都會被視為平等														|																|
|	  靜態循環法	  |    static-rr     |  一般地在一組伺服器之間循序性地分散各項請求，不過不允許動態式配置伺服器的權重。然而，基於伺服器權重的靜態本質，後端中不會有伺服器啟用數量上的限制			|																			|
|	  最少連線排程法  |	  leastconn   	 |  將請求分散至連線數較少的真實伺服器。當處於一個動態式且包含各種 session 或是連線長度的環境中，對管理員來說這個排程器可能會較適合其環境						|									|
|	  來源		  	  |    source  		 |  透過雜湊請求的來源 IP 位址，並除以所有運作中的伺服器的權重，以判斷哪個伺服器將會收到請求																	|
|	  URI		  	  |    uri      	 |  透過雜湊整個 URI（或是 URI 的可配置部分）並除以所有運作中的伺服器的權重，以判斷哪個伺服器將會收到請求														|
|	  URL 參數		  |    url_param     |  藉由在來源 URL 請求中找尋特定參數字串，並執行一項雜湊計算除以所有運作中的伺服器的權重，以將請求分散至伺服器上												|
|	  表頭名稱		  |    hdr    		 |  透過選取各個來源 HTTP 請求中的特定表頭名稱來將請求發佈至伺服器上，並進行一項雜湊計算然後除以所有運作中伺服器的權重											|					|
|	  RDP Cookie	  |    rdp-cookie    |  透過查詢每項 TCP 請求的 RDP cookie 來將請求發佈至伺服器上，並執行一項雜湊計算然後除以所有運作中伺服器的權重													|


參考: https://access.redhat.com/documentation/zh-tw/red_hat_enterprise_linux/7/html/load_balancer_administration/s1-haproxy-setup-global




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
> URL: https://laurance.eu.org/posts/haproxy-%E8%A8%AD%E7%BD%AE%E5%8E%9F%E7%90%86%E8%A7%A3%E6%9E%90/  

