+++
author = "Hugo Authors"
title = "Mysql-1062 主從錯誤 Error 'Duplicate entry 'XXXXX' for key 'XXX'' on query."
date = "2023-01-19"
#description = ""
categories = [
    "Database"
]
tags = [
    "MySQL",
]
image = "100.png"
+++

# 1062錯誤----主鍵沖突，出現這種情況就是從庫出現插入操作，主庫又重新來了一遍，iothread沒問題，sqlthread出錯

 解決方案:

```mysql
stop slave;
set global sql_slave_skip_counter=1;
start slave;
```

上述指令的 SET GLOBAL sql_slave_skip_counter = 1; 代表的是 1 個 event

在 Innodb 中，一個 event 代表的是一組 sql 指令，並非一筆 sql

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
