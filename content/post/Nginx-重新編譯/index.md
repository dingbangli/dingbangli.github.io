+++
author = "Hugo Authors"
title = "Nginx-重新編譯"
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

{{< highlight html >}}

##########################################################################
重新編譯

cd nginx-1.21.6/

./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --sbin-path=/usr/local/nginx/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --error-log-path=/usr/local/nginx/logs/error.log --http-log-path=/usr/local/nginx/logs/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/lock/subsys/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-pcre --with-debug

make

不要做 make install

##########################################################################
停 Nginx

/usr/local/web/nginx/sbin/nginx -s stop

備份舊的nginx程式

cp /usr/local/web/nginx/sbin/nginx/ /usr/local/web/nginx/sbin/nginx.bak

把新的nginx程式覆蓋舊的

cp /root/installation/nginx-1.21.6/objs/nginx /usr/local/web/nginx/sbin/nginx

檢視ngixn版本極其編譯引數

/usr/local/web/nginx/sbin/nginx -V

測試新的nginx程式是否正確

/usr/local/web/nginx/sbin/nginx -t

平滑重啟nginx

/usr/local/web/nginx/sbin/nginx -s reload

{{< /highlight >}}

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
