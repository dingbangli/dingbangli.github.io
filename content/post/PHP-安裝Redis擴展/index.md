+++
author = "Hugo Authors"
title = "PHP-安裝Redis擴展"
date = "2022-08-15"
#description = ""
categories = [
    "Web"
]
tags = [
    "PHP",
]
image = "100.png"
+++

[REDIS](https://pecl.php.net/package/redis)

    wget http://pecl.php.net/get/redis-4.0.0RC2.tgz    
    tar zxvf redis-4.0.0RC2.tgz    
    cd redis-4.0.0RC2
    /usr/local/web/php/bin/phpize
    ./configure -with-php-config=/usr/local/web/php/bin/php-config
    make && make install    
    
    vim /usr/local/php/etc/php.ini    
    extension=redis.so

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
