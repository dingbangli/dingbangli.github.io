# PHP - 如何安裝 memcached 擴展


***
***

[memcached 安裝包](https://pecl.php.net/package/memcached)

***
***

```sql
wget https://pecl.php.net/get/memcached-3.0.3.tgz   

tar zxvf memcached-3.0.3.tgz  
    
cd memcached-3.0.3
    
/usr/local/web/php/bin/phpize
    
./configure -with-php-config=/usr/local/web/php/bin/php-config
    
make && make install    
```

***
***

```sql
vim /usr/local/php/etc/php.ini    
```

```sql
extension=memcached.so
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
> URL: https://laurance.eu.org/posts/php-%E5%AE%89%E8%A3%9Dmemcached%E6%93%B4%E5%B1%95/  

