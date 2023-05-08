+++
author = "Hugo Authors"
title = "Mysql error-1932 Table 'mysql.gtid_slave_pos' doesn't exist in engine"
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

# ERROR "Table doesn't exist in engine" #1932

解決方案:

將 DB 所有資料庫備份為 SQL檔

    mysqldump -uroot -p -S /var/lib/mysql/master01/mysql01.sock --all-databases > all_databases.sql
    
將 DB 砍掉 重新生成預設資料庫

    mysql_install_db --user=mysql --datadir=/var/lib/mysql/master01

再次將 SQL檔重新匯入

    mysql -uroot -p -S /var/lib/mysql/master01/mysql01.sock < all_databases.sql
    
檢查所有資料庫是否有錯誤

    mysqlcheck -c --all-databases -uroot -p -S mysql01.sock
    
    
    
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
