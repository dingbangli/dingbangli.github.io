+++
author = "Hugo Authors"
title = "Mysql-將預設資料庫編碼 latin1 改為 UTF8"
date = "2022-09-27"
#description = ""
categories = [
    "Database"
]
tags = [
    "MySQL",
]
image = "100.png"
+++

   [***** 新版 MySQL 請參考官方文件](https://dev.mysql.com/doc/refman/5.7/en/charset-applications.html)
    
   Step.1 先修改 MySQL Config 讓之後建立的資料庫都使用編碼 UTF8 
   
    $ vim /etc/my.cnf
    
    [mysqld]
    default-character-set=utf8
    default-collation=utf8_unicode_ci
    character-set-server=utf8
    collation-server=utf8_unicode_ci 
    
    datadir=/var/lib/mysql
    socket=/var/lib/mysql/mysql.sock
    user=mysql
    # Disabling symbolic-links is recommended to prevent assorted security risks
    symbolic-links=0
    
    [client]
    default-character-set=utf8
    
    [mysql]
    default-character-set=utf8
    
    [mysqld_safe]
    log-error=/var/log/mysqld.log
    pid-file=/var/run/mysqld/mysqld.pid
    
    #重新啟動MySQL讓設定生效
    $ service mysqld restart
    
   Step.2 若要直接修改，不通過設定檔的方式
   
    ALTER DATABASE dbdata CHARACTER SET utf8 COLLATE utf8_general_ci;
    
    #再查詢編碼
    mysql> status;
        
    ...
    Db     characterset:    utf8
    ...

   Step.3 若要修改已存在的 Tables
   
    $ mysqldump -uroot -prootpw --default-character-set=latin1 --skip-set-charset dbdata > dbdata.sql
    
    #將latin1 取代成 utf8
    $ sed -i 's/latin1/utf8/g' dbdata.sql > dbdata_utf8.sql
    
    #匯入MYSQL
    $ mysql -uroot -prootpw --default-character-set=utf8 dbdata < dbdata_utf8.sql
    
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
