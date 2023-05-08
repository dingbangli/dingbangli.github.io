# PHP - 如何安裝 Redis 擴展


***
***

[REDIS](https://pecl.php.net/package/redis)

***
***

```sql
wget http://pecl.php.net/get/redis-4.0.0RC2.tgz    
    
tar zxvf redis-4.0.0RC2.tgz    

cd redis-4.0.0RC2
    
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
extension=redis.so
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
> URL: https://laurance.eu.org/posts/php-%E5%AE%89%E8%A3%9Dredis%E6%93%B4%E5%B1%95/  

