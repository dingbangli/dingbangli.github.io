# MySQL - 剛載完的密碼存放位置


<!--more-->
實測 MySQL-5.7 會有隨機密碼, MariaDB 則預設沒密碼

***
***

**剛下載完啟動 server 會有一組隨機密碼 存放在 `/var/log/mysqld.log`**
=====

***
***

```sql
vim /var/log/mysqld.log
```

***
***

![](101.png)

***
***
    
**初次登入需要設置 root@localhost 密碼 ( 規則為: 大英 + 小英 + 符號 )**
-----

```sql
SET Password = password('Aaa123456@');
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
> URL: https://laurance.eu.org/posts/mysql-%E5%89%9B%E8%BC%89%E5%AE%8C%E7%9A%84%E5%AF%86%E7%A2%BC%E5%AD%98%E6%94%BE%E4%BD%8D%E7%BD%AE/  

