# MySQL - 報錯 Row size too large (> 8126). Changing some columns to TEXT or BLOB or using ROW_FORMAT ( error 1118 ) 解決方法


***
***

**解決方法: 關閉 mysql 嚴格模式**
=====

***
***

**查看 innodb_strict_mode 參數是否為 on**
-----

```sql
show variables like '%innodb_strict_mode%';
```

***
***
    
**關閉嚴格模式:**
-----

```sql
vim /etc/my.cnf
```
    
```sql
[mysqld] >> innodb_strict_mode = 0
```

***
***

**登入 mysql 後查看設定 `OFF`**
-----

```sql
show variables like '%innodb_strict_mode%';
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
> URL: https://laurance.eu.org/posts/mysql-error-1118-row-size-too-large-8126/  

