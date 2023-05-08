+++
author = "Hugo Authors"
title = "Nginx-添加 echo 模組"
date = "2023-03-13"
#description = ""
categories = [
    "Web"
]
tags = [
    "Nginx",
]
image = "100.png"
+++

安裝編譯環境

```javascript
yum -y install pcre pcre-devel openssl openssl-devel gcc gcc-c++ zlib zlib-devel

```

在 `Nginx` 安裝包裡 下載 `echo模組安裝包` && 解壓縮

```javascript
cd /root/installation/nginx-1.21.6/

wget https://github.com/openresty/echo-nginx-module/archive/v0.61.tar.gz

tar zxvf v0.61.tar.gz

```

查看原本的編譯參數

```javascript
/usr/local/web/nginx/sbin/nginx -V

```

重新編譯一次

```javascript
./configure --user=nginx --group=nginx --prefix=/usr/local/web/nginx --sbin-path=/usr/local/web/nginx/sbin/nginx --conf-path=/usr/local/web/nginx/conf/nginx.conf --error-log-path=/usr/local/web/nginx/logs/error.log --http-log-path=/usr/local/web/nginx/logs/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/lock/subsys/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-pcre --with-http_realip_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_secure_link_module --with-http_v2_module --with-http_stub_status_module --with-http_sub_module --add-module=/usr/local/incubator-pagespeed-ngx-1.13.35.2-stable/ --add-module=/usr/local/nginx-http-concat/ --with-http_geoip_module --add-module=/root/installation/nginx-1.21.6/echo-nginx-module-0.61

make  #不要 make install 會重複安裝

```

停 nginx 服務

```javascript
/usr/local/web/nginx/sbin/nginx -s stop

```

將原本的執行檔備份為 nginx.bak

```javascript
cp /usr/local/web/nginx/sbin/nginx /usr/local/web/nginx/sbin/nginx.bak

```

將新的執行檔複製到執行路徑裡

```javascript
cp /root/installation/nginx-1.21.6/objs/nginx /usr/local/web/nginx/sbin/nginx

```

再次查看已編譯進去了

```javascript
/usr/local/web/nginx/sbin/nginx -V

```

---

# echo 模組用法:

```javascript
location /test {  
  echo "uri = $uri";  
  echo "request_uri = $request_uri";  
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
