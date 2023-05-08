# PHP - 如何安裝 MongoDB 擴展


***
***

[MongoDB 安裝包](https://pecl.php.net/package/mongodb)

***
***

```sql
wget http://pecl.php.net/get/mongodb-1.3.4.tgz    

tar -zxvf mongodb-1.3.4.tgz    

cd mongodb-1.3.4.tgz    

/usr/local/web/php/bin/phpize    
    
./configure -with-php-config=/usr/local/web/php/bin/php-config    
    
make & make test & make install
```

***
***
    
```sql
vim /usr/local/php/etc/php.ini    
```    
    
```sql
extension=mongodb.so
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
> URL: https://laurance.eu.org/posts/php-%E5%AE%89%E8%A3%9Dmongodb%E6%93%B4%E5%B1%95/  

