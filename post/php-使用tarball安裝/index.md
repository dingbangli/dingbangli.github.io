# PHP - 自行編譯安裝 (版本:php-7.0.1)


***
***

**安裝依賴**
------

***
***

```sql
yum -y install dos2unix libzip libzip-devel libncurses*
yum -y install gcc*
yum -y install openssl openssl-devel
yum -y install openldap openldap-devel
yum -y install libjpeg-devel 
yum -y install libpng-devel
yum -y install libxml2-devel
yum -y install libevent-devel
yum -y install curl-devel
yum -y install freetype-devel
yum -y install m4
yum -y install autoconf
yum -y install unzip
yum -y install git 

yum -y update
yum clean all
```

***
***

```sql
tar zxvf libiconv-1.14.tar.gz
cd libiconv-1.14/
./configure --prefix=/usr/local/web
make
make install
cd ../

tar zxvf libmcrypt-2.5.8.tar.gz
cd libmcrypt-2.5.8/
./configure
make
make install
/sbin/ldconfig
cd libltdl/
./configure --enable-ltdl-install
make
make install
cd ../../

tar zxvf mhash-0.9.9.9.tar.gz
cd mhash-0.9.9.9/
./configure
make
make install
cd ../

tar zxvf mcrypt-2.6.8.tar.gz
cd mcrypt-2.6.8/
/sbin/ldconfig
export LD_LIBRARY_PATH=/usr/local/lib: LD_LIBRARY_PATH
./configure
make
make install
cd ../

tar zxvf libgd-2.2.5.tar.gz
cd libgd-2.2.5
./configure --bindir=/usr/sbin/ --sbindir=/usr/sbin/ --libexecdir=/usr/libexec --sysconfdir=/etc/ --localstatedir=/var --libdir=/usr/lib64/  --includedir=/usr/include/ --datarootdir=/usr/share --infodir=/usr/share/info --localedir=/usr/share/locale --mandir=/usr/share/man/ --docdir=/usr/share/doc/libgd
make
make install
cd ../
```

***
***

```sql
ln -s /usr/local/lib/libmcrypt.la /usr/lib/libmcrypt.la
ln -s /usr/local/lib/libmcrypt.so /usr/lib/libmcrypt.so
ln -s /usr/local/lib/libmcrypt.so.4 /usr/lib/libmcrypt.so.4
ln -s /usr/local/lib/libmcrypt.so.4.4.8 /usr/lib/libmcrypt.so.4.4.8
ln -s /usr/local/lib/libmhash.a /usr/lib/libmhash.a
ln -s /usr/local/lib/libmhash.la /usr/lib/libmhash.la
ln -s /usr/local/lib/libmhash.so /usr/lib/libmhash.so
ln -s /usr/local/lib/libmhash.so.2 /usr/lib/libmhash.so.2
ln -s /usr/local/lib/libmhash.so.2.0.1 /usr/lib/libmhash.so.2.0.1
ln -s /usr/local/bin/libmcrypt-config /usr/bin/libmcrypt-config

cp -frp /usr/lib64/libldap* /usr/lib/
```

***
***

**安裝 php ( 版本:7.0.1 )**
------

***
***

[官網安裝tar包](https://www.php.net/releases/index.php)

***
***

```sql
tar -zxvf php-7.0.1.tar.gz

'./configure' '--prefix=/usr/local/web/php' '--with-config-file-path=/usr/local/web/php/etc' '--with-mysqli' '--with-iconv-dir=/usr/local'  '--with-freetype-dir' '--with-jpeg-dir' '--with-gd' '--enable-gd-native-ttf' '--with-zlib' '--enable-libxml' '--enable-xml' '--disable-rpath' '--enable-bcmath' '--enable-shmop' '--enable-sysvsem' '--enable-inline-optimization' '--with-curl' '--enable-mbregex' '--enable-fpm' '--enable-mbstring'  '--with-openssl' '--with-mhash' '--enable-pcntl' '--enable-sockets' '--with-ldap' '--with-ldap-sasl' '--with-xmlrpc' '--enable-zip' '--enable-soap' '--enable-opcache' '--enable-ftp' '--enable-sysvshm' '--with-mcrypt' 

sed -i 's/-lcrypto -lcrypt.*/& -llber/g' Makefile

make && make install
```

***
***

```sql
cp php.ini-production /usr/local/web/php/etc/php.ini

cp sapi/fpm/php-fpm.service /usr/lib/systemd/system/

cp /usr/local/web/php/etc/php-fpm.conf.default /usr/local/web/php/etc/php-fpm.conf

cp /usr/local/web/php/etc/php-fpm.d/www.conf.default /usr/local/web/php/etc/php-fpm.d/www.conf
```

***
***

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


---

> Author: Laurance  
> URL: https://laurance.eu.org/posts/php-%E4%BD%BF%E7%94%A8tarball%E5%AE%89%E8%A3%9D/  

