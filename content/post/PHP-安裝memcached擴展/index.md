+++
author = "Hugo Authors"
title = "PHP-安裝memcached擴展"
date = "2022-09-30"
#description = ""
categories = [
    "Web"
]
tags = [
    "PHP",
]
image = "100.png"
+++

[REDIS](https://pecl.php.net/package/memcached)

    wget https://pecl.php.net/get/memcached-3.0.3.tgz   
    tar zxvf memcached-3.0.3.tgz  
    cd memcached-3.0.3
    /usr/local/web/php/bin/phpize
    ./configure -with-php-config=/usr/local/web/php/bin/php-config
    make && make install    
    
    vim /usr/local/php/etc/php.ini    
    extension=memcached.so

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
