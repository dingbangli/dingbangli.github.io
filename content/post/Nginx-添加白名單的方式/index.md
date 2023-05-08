+++
author = "Hugo Authors"
title = "Nginx-添加白名單 & 封鎖國家 IP 方式"
date = "2022-12-25"
#description = ""
categories = [
    "Web"
]
tags = [
    "Nginx",
]
image = "100.png"
+++

# 1. IP白名單文件讀取

建立白名單文件

    vim /usr/local/web/nginx/conf/vhost/hugo/whitelist.conf

```javascript
    allow 172.16.0.6;
```

配置設定檔引入白名單文件

    vim /usr/local/web/nginx/conf/vhost/hugo/hugo.conf
  
```angularjs

location  / {
    
.
.
.
.
    include /usr/local/web/nginx/conf/vhost/hugo/whitelist.conf;
    deny all;
    
    }
```

    cat /usr/local/web/nginx/conf/vhost/hugo/whitelist.conf
    
    allow 172.16.0.6;
    
# 2.國家IP封鎖
    
Nginx 主設定檔的**http 區塊**加入GEO模塊並引用**dat 文件**

從 $remote_addr 這個變數, 來定義 $ip_whitelist 這個變數

    vim /usr/local/web/nginx/conf/nginx.conf
    
```javascript
geoip_country /usr/local/web/nginx/conf/vhost/hugo/GeoCountry/country/maxmind.dat;

geo $remote_addr $ip_whitelist {
    default 0;
}
```

建立一支定義GEO規則的設定檔

    vim /usr/local/web/nginx/conf/vhost/geoblock.conf
    
```javascript
if ($ip_whitelist = 1) {
    break;
}

if ($geoip_country_code ~ (JP|TW)) {
    return 403;
}
```

在配置的設定檔上**server 區塊**引用GEO規則的設定檔

    vim /usr/local/web/nginx/conf/vhost/hugo/hugo.conf
    
```javascript
server {

    listen 1515;
#    listen [::]:1515;
    server_name note.laurance.com;

    include vhost/geoblock.conf;
    
    .
    .
    .
    .
    .
     }
```

***

# 使用 Nginx 阻擋國家IP,需要編譯模塊 http_geoip_module

下載 geoip 安裝包

    yum install geoip-devel
    
ps. 若找不到安裝包,可先安裝 epel 倉庫  
yum install epel-release -y

檢查庫是否安裝成功

    ldconfig -v | grep GeoIP        

```javascript
libGeoIPUpdate.so.0 -> libGeoIPUpdate.so.0.0.0
libGeoIP.so.1 -> libGeoIP.so.1.4.8
libGeoIPUpdate.so.0 -> libGeoIPUpdate.so.0.0.0
libGeoIP.so.1 -> libGeoIP.so.1.5.0
```

將 GeoIP 模塊重新編譯到 Nginx 中 (原有的編譯參數可用 nginx -V 查看)

( 不要 make install 否則覆蓋安裝就麻煩了 )

    ./configure --user=nginx --group=nginx --prefix=/usr/local/web/nginx --sbin-path=/usr/local/web/nginx/sbin/nginx --conf-path=/usr/local/web/nginx/conf/nginx.conf --error-log-path=/usr/local/web/nginx/logs/error.log --http-log-path=/usr/local/web/nginx/logs/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/lock/subsys/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-pcre --with-http_realip_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_secure_link_module --with-http_v2_module --with-http_stub_status_module --with-http_sub_module --add-module=/usr/local/incubator-pagespeed-ngx-1.13.35.2-stable/ --add-module=/usr/local/nginx-http-concat/ --with-http_geoip_module
    
    make

    unlink /usr/sbin/nginx 
    
    mv /usr/local/web/nginx/sbin/nginx /usr/local/web/nginx/sbin/nginx-2023-01-01.bak
    
    cp objs/nginx /usr/local/web/nginx/sbin/nginx
    
    /usr/local/web/nginx/sbin/nginx -V
    
查看 GEO 模塊是否已編入

    /usr/local/web/nginx/sbin/nginx -V 2>&1 | grep -o with-http_geoip_module
    
    
***

# 下載 IP 數據庫 (dat 格式) 

[ 第三方下載地址 ] https://www.miyuru.lk/geoiplegacy

下載同時包括Ipv4和Ipv6的country、city版本。

    wget https://dl.miyuru.lk/geoip/maxmind/country/maxmind.dat.gz
    
    gunzip maxmind.dat.gz
    
    wget https://dl.miyuru.lk/geoip/maxmind/city/maxmind.dat.gz
    
    gunzip maxmind.dat.gz
    
配置請看上面

***

    國家相關參數：
        
    $geoip_country_code #兩位字符的英文國家碼。如：CN, US
    
    $geoip_country_code3 #三位字符的英文國家碼。如：CHN, USA
    
    $geoip_country_name #國家英文全稱。如：China, United States
    
    城市相關參數：    
    
    $geoip_city_country_code #也是兩位字符的英文國家碼。
    
    $geoip_city_country_code3 #上同
    
    $geoip_city_country_name #上同.
    
    $geoip_region #這個經測試是兩位數的數字，如杭州是02, 上海是 23。但是沒有搜到相關資料，希望知道的朋友留言告之。
    
    $geoip_city #城市的英文名稱。如：Hangzhou
    
    $geoip_postal_code #城市的郵政編碼。經測試，國內這字段為空
    
    $geoip_city_continent_code #不知什麼用途，國內好像都是AS
    
    $geoip_latitude #緯度
    
    $geoip_longitude #經度
    

[參考] https://www.ywbj.cc/?p=787
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
