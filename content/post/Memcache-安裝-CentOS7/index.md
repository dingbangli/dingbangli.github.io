+++
author = "Hugo Authors"
title = "Memcache-安裝-CentOS7"
date = "2022-08-16"
#description = ""
categories = [
    "Database"
]
tags = [
    "Memcache",
]
image = "100.jpeg"
+++



    依賴
    yum install libevent libevent-devel
    yum install perl-Test* (make test報錯)
    
    wget http://memcached.googlecode.com/files/memcached-1.4.8.tar.gz
    tar zxvf memcached-1.4.8.tar.gz
    cd memcached-1.4.8
    make && make test
    make install
    
    ./memcached -d -m 2048 -u nobody  -p 12000 -c 2048 -P /tmp/memcached.pid	啟動服務
    pkill memcached									停止服務



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
