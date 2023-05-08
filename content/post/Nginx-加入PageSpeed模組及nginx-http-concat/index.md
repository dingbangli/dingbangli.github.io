+++
author = "Hugo Authors"
title = "Nginx-加入PageSpeed模組及nginx-http-concat"
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
    
    PageSpeed模組(自動優化網站動態)下載
    
    wget https://github.com/apache/incubator-pagespeed-ngx/archive/v1.13.35.2-stable.tar.gz
    
    tar zxvf v1.13.35.2-stable.tar.gz
    
    cd incubator-pagespeed-ngx-1.13.35.2-stable
    
    #這一步一定要做 不然nginx會無法加入模組 解壓縮會在根目錄下生成一個psol的資料夾 (解壓後將psol/放到incubator-pagespeed-ngx-1.13.35.2-stable/裡)
    
    cat PSOL_BINARY_URL
    
    wget https://dl.google.com/dl/page-speed/psol/1.13.35.2-x64.tar.gz
    
    tar zxvf 1.13.35.2-x64.tar.gz
    
    cd ../
    
    mv incubator-pagespeed-ngx-1.13.35.2-stable /usr/local/incubator-pagespeed-ngx-1.13.35.2-stable/
    
    nginx-http-concat模組(合併HTTP請求)下載
    
    wget https://github.com/alibaba/nginx-http-concat/archive/1.2.2.tar.gz
    
    tar zxvf 1.2.2.tar.gz
    
    mv nginx-http-concat-1.2.2/ /usr/local/nginx-http-concat/
    
    nginx編譯安裝
    
    cd nginx-1.21.6/
    
    ./configure --user=nginx --group=nginx --prefix=/usr/local/web/nginx --sbin-path=/usr/local/web/nginx/sbin/nginx --conf-path=/usr/local/web/nginx/conf/nginx.conf --error-log-path=/usr/local/web/nginx/logs/error.log --http-log-path=/usr/local/web/nginx/logs/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/lock/subsys/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-pcre --with-http_realip_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_secure_link_module --with-http_v2_module --with-http_stub_status_module --with-http_sub_module --add-module=/usr/local/incubator-pagespeed-ngx-1.13.35.2-stable/ --add-module=/usr/local/nginx-http-concat/
    
    make && make install (重新編譯的話不需要make install)
    
    [重新編譯執行以下步驟]
    
    /usr/local/web/nginx/sbin/nginx -s stop
    
    cp /usr/local/nginx/sbin/nginx/ /usr/local/nginx/sbin/nginx.bak
    
    cp /root/installation/nginx-1.21.6/objs/nginx /usr/local/nginx/sbin/nginx
    
    檢查是否有加入模組
    
    /usr/local/web/nginx/sbin/nginx -V
    
    nginx.conf設定檔新增pagespeed配置
    
    http區段加入
    
    pagespeed on;
    pagespeed FileCachePath /var/cache/nginx/ngx_pagespeed_cache;
    server區段加入
    
    # Rewrite Level
    pagespeed RewriteLevel CoreFilters;
    
    # Minimize and optimize HTTP requests
    pagespeed EnableFilters rewrite_css;
    pagespeed EnableFilters rewrite_javascript;
    pagespeed EnableFilters combine_css;
    pagespeed EnableFilters combine_javascript;
    pagespeed EnableFilters inline_css;
    pagespeed CssInlineMaxBytes 4096;
    pagespeed EnableFilters inline_javascript;
    pagespeed JsInlineMaxBytes 4096;
    
    # Image Optimization and lazy load
    pagespeed EnableFilters rewrite_images;
    pagespeed EnableFilters inline_images;
    pagespeed EnableFilters resize_images;
    pagespeed EnableFilters recompress_images;
    
    # Controlling the use of beacons
    pagespeed AvoidRenamingIntrospectiveJavascript off;
    pagespeed CriticalImagesBeaconEnabled false;
    
    
    location ~ "\.pagespeed\.([a-z]\.)?[a-z]{2}\.[^.]{10}\.[^.]+" {
            add_header "" "";
            }
        location ~ "^/pagespeed_static/" { }
        location ~ "^/ngx_pagespeed_beacon$" { }
    
    重啟nginx
    
    /usr/local/web/nginx/sbin/nginx -s reload

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
