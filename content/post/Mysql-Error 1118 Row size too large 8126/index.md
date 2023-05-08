+++
author = "Hugo Authors"
title = "Mysql-Error 1118 (42000) at line 4904: Row size too large (> 8126). Changing some columns to TEXT or BLOB or using ROW_FORMAT"
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

#ERROR (42000) at line 4904: Row size too large (> 8126). Changing some columns to TEXT or BLOB or using ROW_FORMAT #1118

解決方法: 關閉 mysql 嚴格模式

查看 innodb_strict_mode 參數是否為 on

    show variables like '%innodb_strict_mode%';
    
關閉嚴格模式:

    vim /etc/my.cnf
    
```mysql
[mysqld] >> innodb_strict_mode = 0 # 嚴格模式關閉
```

登入後查看為OFF

    show variables like '%innodb_strict_mode%';
    
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
