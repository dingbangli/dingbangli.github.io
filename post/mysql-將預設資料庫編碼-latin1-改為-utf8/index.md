# MySQL - 將預設資料庫編碼 `latin1` 改為 `UTF 8`


***
***

[***** 新版 MySQL 請參考官方文件](https://dev.mysql.com/doc/refman/5.7/en/charset-applications.html)

***
***
    
**Step.1 先修改 MySQL Config 讓之後建立的資料庫都使用編碼 `UTF8`**
----- 
   
```sql
vim /etc/my.cnf
```
    
```sql
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
```

***

**重新啟動 MySQL 讓設定生效**

```sql
service mysqld restart
```

***
***
    
**Step.2 若要直接修改，不通過設定檔的方式**
-----

***
   
```sql
ALTER DATABASE dbdata CHARACTER SET utf8 COLLATE utf8_general_ci;
```    

***
    
**再進入 Mysql 介面查詢編碼**
 
```sql
mysql> status;
```

***
***

**Step.3 若要修改已存在的 Tables**
-----

***
   
```sql
mysqldump -uroot -prootpw --default-character-set=latin1 --skip-set-charset dbdata > dbdata.sql
```

***
    
**將 `latin1` 取代成 `utf8`**

```sql
sed -i 's/latin1/utf8/g' dbdata.sql > dbdata_utf8.sql
```

***
    
**匯入 `MYSQL`**

```sql
mysql -uroot -prootpw --default-character-set=utf8 dbdata < dbdata_utf8.sql
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
> URL: https://laurance.eu.org/posts/mysql-%E5%B0%87%E9%A0%90%E8%A8%AD%E8%B3%87%E6%96%99%E5%BA%AB%E7%B7%A8%E7%A2%BC-latin1-%E6%94%B9%E7%82%BA-utf8/  

