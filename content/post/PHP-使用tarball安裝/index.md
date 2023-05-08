+++
author = "Hugo Authors"
title = "PHP-使用TARBALL安裝"
date = "2022-08-03"
#description = ""
categories = [
    "Web"
]
tags = [
    "PHP",
]
image = "100.png"
+++

{{< highlight html >}}

安裝依賴

wget ftp://mcrypt.hellug.gr/pub/crypto/mcrypt/attic/libmcrypt/libmcrypt-2.5.7.tar.gz

tar -zxvf libmcrypt-2.5.7.tar.gz

cd libmcrypt-2.5.7

./configure  --prefix=/usr/local

make & make install

yum -y install gcc gcc-c++  make cmake automake autoconf kernel-devel ncurses-devel libxml2-devel openssl-devel curl-devel libjpeg-devel libpng-devel  pcre-devel libtool libtool-libs freetype-devel gd zlib-devel file bison patch mlocate flex diffutils   readline-devel glibc-devel glib2-devel bzip2-devel gettext-devel libcap-devel openldap openldap-devel libxslt-devel sqlite-devel 

yum install mysql-devel

[官網安裝tar包](https://www.php.net/releases/index.php)

vim /etc/ld.so.conf.d/local.conf

/usr/local/lib  # 添加该行 , 如果不行 , 则用/usr/local/lib64

:wq

ldconfig -v     # 使之生效

########################################

cp -frp /usr/lib64/libldap* /usr/lib/

ln -s /usr/lib64/liblber* /usr/lib/

########################################

tar -zxvf php-7.0.1.tar.gz

'./configure' '--prefix=/usr/local/web/php' '--with-config-file-path=/usr/local/web/php/etc' '--with-mysqli=/usr/bin/mysql_config' '--with-iconv-dir=/usr/local' '--with-freetype-dir' '--with-jpeg-dir' '--with-png-dir' '--with-zlib' '--with-libxml-dir=/usr' '--enable-xml' '--disable-rpath' '--enable-bcmath' '--enable-shmop' '--enable-sysvsem' '--enable-inline-optimization' '--with-curl' '--enable-mbregex' '--enable-fpm' '--enable-mbstring' '--with-mcrypt' '--with-gd' '--enable-gd-native-ttf' '--with-openssl' '--with-mhash' '--enable-pcntl' '--enable-sockets' '--with-ldap' '--with-ldap-sasl' '--with-xmlrpc' '--enable-zip' '--enable-soap' '--enable-opcache' '--enable-ftp'

vim Makefile

>>>EXTRA_LIBS = ... -lcrypt -llber -liconv

make & make test & make install

########################################

cp php.ini-production /usr/local/web/php/etc/php.ini

cp sapi/fpm/php-fpm.service /usr/lib/systemd/system/

cp /usr/local/web/php/etc/php-fpm.conf.default /usr/local/web/php/etc/php-fpm.conf

cp /usr/local/web/php/etc/php-fpm.d/www.conf.default /usr/local/web/php/etc/php-fpm.d/www.conf


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
