# Cacti - 安裝方法


<!--more-->
"紀錄一下建立 CACTI 語法，包含建立前置作業 LAMP"

```sql

    rpm -qa | grep mariadb
    rpm -qa | grep mysql
 
    yum install mysql-community-server mysql-devel
    
    ./configure --prefix=/usr/local/web/apache2 --enable-ssl --enable-so  --enable-vhost-alias  --with-mpm=prefork
    
    './configure' '--prefix=/usr/local/web/php' '--with-apxs2=/usr/local/web/apache2/bin/apxs' '--with-mysql' '--with-mysqli' '--disable-cgi' '--with-iconv' '--disable-inline-optimization' '--enable-mbstring=tw' '--enable-sysvshm' '--enable-sysvsem' '--enable-sockets' '--with-jpeg-dir' '--with-png-dir' '--with-gd' '--with-zlib' '--with-curl' '--enable-zip' '--with-openssl-dir=/usr/lib/openssl' '--with-openssl' '--enable-opcache'
    
    tar zxvf cacti-0.8.7g.tar.gz
    
    mv cacti-0.8.7g /home/cacti
    
    yum install -y net-snmp  net-snmp-utils
    
    tar zxvf rrdtool-1.0.50.tar.gz
    cd rrdtool-1.0.50
    ./configure --prefix=/usr/local/rrdtool 
    make
    make install
    
    #ln -s /usr/local/libpng/lib/libpng.so /usr/lib/ 
    #ln -s /usr/local/freetype/lib/libfreetype.so /usr/lib/
    #yum -y install freetype-devel
    #yum -y install libpng-devel
    #yum -y install libart_lgpl-devel
    
    mysqld_safe &
 
    mysqladmin -u root password '密碼' 
    
    mysqladmin --user=root -p create cacti
    
    cd    /home/cacti/ 
    mysql -u root -p cacti < cacti.sql 
    
    mysql    -u    root    -p 
    mysql> grant all on cacti.* to cactiuser@localhost identified by '123456'; 
    mysql> flush privileges; 
    mysql> exit 
    
    vim /home/cacti/include/config.php 
    
      26 $database_type = "mysql"; 
      27 $database_default = "cacti"; 
      28 $database_hostname = "localhost"; 
      29 $database_username = "cactiuser"; 
      30 $database_password = "kiwi888"; 
      31 $database_port = "3306";
      
    useradd cactiuser
    
    su - cactiuser
    
    crontab -e

    */1 * * * * /usr/local/bin/php  /home/cacti/poller.php > /dev/null 2>&1
    
    exit
    
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


---

> Author: Laurance  
> URL: https://laurance.eu.org/posts/cacti-%E5%AE%89%E8%A3%9D%E6%96%B9%E6%B3%95/  

