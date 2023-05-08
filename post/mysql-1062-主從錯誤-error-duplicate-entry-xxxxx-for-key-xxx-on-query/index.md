# MySQL - 主從報錯 Error 'Duplicate entry 'XXXXX' for key 'XXX'' on query. ( error 1062 ) 解決方法


<!--more-->
error 1062 ---- 主鍵沖突，出現這種情況就是從庫出現插入操作，主庫又重新來了一遍 `iothread` 沒問題 `sqlthread` 出錯

***
***

**解決方案:**
=====

***
***

```sql
stop slave;

set global sql_slave_skip_counter=1;

start slave;
```

***
***

{{< admonition example >}}

### 上述指令的 SET GLOBAL sql_slave_skip_counter = 1; 代表的是 1 個 event


### 在 Innodb 中，一個 event 代表的是一組 sql 指令，並非一筆 sql

{{< /admonition >}}

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
> URL: https://laurance.eu.org/posts/mysql-1062-%E4%B8%BB%E5%BE%9E%E9%8C%AF%E8%AA%A4-error-duplicate-entry-xxxxx-for-key-xxx-on-query/  

