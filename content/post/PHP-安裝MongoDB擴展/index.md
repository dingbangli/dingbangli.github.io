+++
author = "Hugo Authors"
title = "PHP-安裝MongoDB擴展"
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

[MongoDB](https://pecl.php.net/package/mongodb)

    wget http://pecl.php.net/get/mongodb-1.3.4.tgz    
    tar -zxvf mongodb-1.3.4.tgz    
    cd mongodb-1.3.4.tgz    
    /usr/local/web/php/bin/phpize    
    ./configure -with-php-config=/usr/local/web/php/bin/php-config    
    make & make test & make install
    
    vim /usr/local/php/etc/php.ini    
    extension=mongodb.so

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
