+++
author = "Hugo Authors"
title = "Nginx-Config配置"
date = "2022-08-03"
#description = ""
categories = [
    "Web"
]
tags = [
    "Nginx",
]
image = "100.png"
+++



    #定義Nginx運行的用戶和用戶組

    user www www;
    
    #nginx進程數，建議設置為等於CPU總核心數。
    
    worker_processes 8;
    
    #全局錯誤日誌定義類型，[ debug | info | notice | warn | error | crit ]
    
    error_log /var/log/nginx/error.log info;
    
    #進程文件
    
    pid /var/run/nginx.pid;
    
    #一個nginx進程打開的最多文件描述符數目，理論值應該是最多打開文件數（系統的值ulimit -n）與nginx進程數相除，但是nginx分配請求並不均勻，所以建議與ulimit -n的值保持一致。
    
    worker_rlimit_nofile 65535;
    
    #工作模式與連接數上限
    
    events
    
    {
    
    #參考事件模型，use [ kqueue | rtsig | epoll | /dev/poll | select | poll ]; epoll模型是Linux 2.6以上版本內核中的高性能網絡I/O模型，如果跑在FreeBSD上面，就用kqueue模型。
    
    
     
    use epoll;
    
    #單個進程最大連接數（最大連接數=連接數*進程數）
    
    worker_connections 65535;
    
    }
    
    #設定http伺服器
    
    http
    
    {
    
    include mime.types; #文件擴展名與文件類型映射表
    
    default_type application/octet-stream; #默認文件類型
    
    #charset utf-8; #默認編碼
    
    server_names_hash_bucket_size 128; #伺服器名字的hash表大小
    
    client_header_buffer_size 32k; #上傳文件大小限制
    
    large_client_header_buffers 4 64k; #設定請求緩
    
    client_max_body_size 8m; #設定請求緩
    
    sendfile on; #開啟高效文件傳輸模式，sendfile指令指定nginx是否調用sendfile函數來輸出文件，對於普通應用設為 on，如果用來進行下載等應用磁碟IO重負載應用，可設置為off，以平衡磁碟與網絡I/O處理速度，降低系統的負載。注意：如果圖片顯示不正常把這個改成off。
    
    
     
    autoindex on; #開啟目錄列表訪問，合適下載伺服器，默認關閉。
    
    tcp_nopush on; #防止網絡阻塞
    
    tcp_nodelay on; #防止網絡阻塞
    
    keepalive_timeout 120; #長連接超時時間，單位是秒
    
    #FastCGI相關參數是為了改善網站的性能：減少資源占用，提高訪問速度。下面參數看字面意思都能理解。
    
    fastcgi_connect_timeout 300;
    
    fastcgi_send_timeout 300;
    
    fastcgi_read_timeout 300;
    
    fastcgi_buffer_size 64k;
    
    fastcgi_buffers 4 64k;
    
    fastcgi_busy_buffers_size 128k;
    
    fastcgi_temp_file_write_size 128k;
    
    #gzip模塊設置
    
    gzip on; #開啟gzip壓縮輸出
    
    
     
    gzip_min_length 1k; #最小壓縮文件大小
    
    gzip_buffers 4 16k; #壓縮緩衝區
    
    gzip_http_version 1.0; #壓縮版本（默認1.1，前端如果是squid2.5請使用1.0）
    
    gzip_comp_level 2; #壓縮等級
    
    gzip_types text/plain application/x-javascript text/css application/xml;
    
    #壓縮類型，默認就已經包含text/html，所以下面就不用再寫了，寫上去也不會有問題，但是會有一個warn。
    
    gzip_vary on;
    
    #limit_zone crawler $binary_remote_addr 10m; #開啟限制IP連接數的時候需要使用
    
    upstream blog.ha97.com {
    
    #upstream的負載均衡，weight是權重，可以根據機器配置定義權重。weigth參數表示權值，權值越高被分配到的機率越大。
    
    
     
    server 192.168.80.121:80 weight=3;
    
    server 192.168.80.122:80 weight=2;
    
    server 192.168.80.123:80 weight=3;
    
    }
    
    #虛擬主機的配置
    
    server
    
    {
    
    #監聽埠
    
    listen 80;
    
    #域名可以有多個，用空格隔開
    
    server_name www.ha97.com ha97.com;
    
    index index.html index.htm index.php;
    
    root /data/www/ha97;
    
    location ~ .*\.(php|php5)?$
    
    {
    
    fastcgi_pass 127.0.0.1:9000;
    
    fastcgi_index index.php;
    
    include fastcgi.conf;
    
    }
    
    #圖片緩存時間設置
    
    location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
    
    
     
    {
    
    expires 10d;
    
    }
    
    #JS和CSS緩存時間設置
    
    location ~ .*\.(js|css)?$
    
    {
    
    expires 1h;
    
    }
    
    #日誌格式設定
    
    log_format access '$remote_addr - $remote_user [$time_local] "$request" '
    
    '$status $body_bytes_sent "$http_referer" '
    
    '"$http_user_agent" $http_x_forwarded_for';
    
    #定義本虛擬主機的訪問日誌
    
    access_log /var/log/nginx/ha97access.log access;
    
    #對 "/" 啟用反向代理
    
    location / {
    
    proxy_pass http://127.0.0.1:88;
    
    proxy_redirect off;
    
    proxy_set_header X-Real-IP $remote_addr;
    
    
     
    #後端的Web伺服器可以通過X-Forwarded-For獲取用戶真實IP
    
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    
    #以下是一些反向代理的配置，可選。
    
    proxy_set_header Host $host;
    
    client_max_body_size 10m; #允許客戶端請求的最大單文件字節數
    
    client_body_buffer_size 128k; #緩衝區代理緩衝用戶端請求的最大字節數，
    
    proxy_connect_timeout 90; #nginx跟後端伺服器連接超時時間(代理連接超時)
    
    proxy_send_timeout 90; #後端伺服器數據回傳時間(代理髮送超時)
    
    proxy_read_timeout 90; #連接成功後，後端伺服器響應時間(代理接收超時)
    
    proxy_buffer_size 4k; #設置代理伺服器（nginx）保存用戶頭信息的緩衝區大小
    
    proxy_buffers 4 32k; #proxy_buffers緩衝區，網頁平均在32k以下的設置
    
    proxy_busy_buffers_size 64k; #高負荷下緩衝大小（proxy_buffers*2）
    
    proxy_temp_file_write_size 64k;
    
    #設定緩存文件夾大小，大於這個值，將從upstream伺服器傳
    
    }
    
    #設定查看Nginx狀態的地址
    
    location /NginxStatus {
    
    stub_status on;
    
    access_log on;
    
    auth_basic "NginxStatus";
    
    auth_basic_user_file conf/htpasswd;
    
    #htpasswd文件的內容可以用apache提供的htpasswd工具來產生。
    
    }
    
    #本地動靜分離反向代理配置
    
    #所有jsp的頁面均交由tomcat或resin處理
    
    location ~ .(jsp|jspx|do)?$ {
    
    proxy_set_header Host $host;
    
    proxy_set_header X-Real-IP $remote_addr;
    
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    
    proxy_pass http://127.0.0.1:8080;
    
    }
    
    #所有靜態文件由nginx直接讀取不經過tomcat或resin
    
    location ~ .*.(htm|html|gif|jpg|jpeg|png|bmp|swf|ioc|rar|zip|txt|flv|mid|doc|ppt|pdf|xls|mp3|wma)$
    
    { expires 15d; }
    
    location ~ .*.(js|css)?$
    
    { expires 1h; }
    
    }
    
    }

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
