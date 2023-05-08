+++
author = "Hugo Authors"
title = "Mysqldump-備份&還原資料庫"
date = "2022-08-03"
#description = ""
categories = [
    "Database"
]
tags = [
    "MySQL",
]
image = "100.png"
+++


    備份單一資料庫
    mysqldump -h hostname -u root -p database_name > backup.sql;
    
    備份資料庫中單一資料表
    mysqldump -u root -p database_name table_name > backup.sql;
    
    匯出資料庫中的某張資料表的表結構（不含資料）
    mysqldump -u username -p -d dbname tablename > tablename.sql   
    
    備份資料庫中多張資料表
    mysqldump -u root -p database_name table1 table2 > backup.sql;
    
    備份多個資料庫
    mysqldump -u root -p --databases db1 db2 > backup.sql;
    
    備份所有資料庫
    mysqldump -u root -p --all-databases > backup.sql;
    
    匯出資料庫結構（不含資料）
    mysqldump -u username -p -d dbname > dbname.sql    
    
    
    ----------------------------
    
    復原單一資料庫
    mysql -u root -p database_name < backup.sql
    
    復原多個資料庫
    mysql -u root -p < backup.sql
    
    ----------------------------



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
