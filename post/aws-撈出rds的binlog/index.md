# AWS - 撈出 RDS 的 binlog


<!--more-->
"紀錄一下使用 mysql 工具 撈出 RDS 的 binlog"

{{< admonition >}}
撈出 RDS binlog
{{< /admonition >}}

```sql
cd /home/mariadb/binlog

mysqlbinlog --base64-output=decode-rows -v --set-charset="utf8" --start-datetime="2021-11-04 14:06:00" --stop-datetime="2021-11-04 14:09:00"   mysql-bin-changelog.450599 > /home/laurance/RDS-1104-1405-1410.sql
```

{{< admonition >}}    
傳至其他機器
{{< /admonition >}}

```sql
scp RDS-1005-1330-1430.sql laurance@admin:~ 
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
> URL: https://laurance.eu.org/posts/aws-%E6%92%88%E5%87%BArds%E7%9A%84binlog/  

