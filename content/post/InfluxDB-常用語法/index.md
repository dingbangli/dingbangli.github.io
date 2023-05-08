+++
author = "Hugo Authors"
title = "InfluxDB 常用語法"
date = "2022-08-03"
#description = ""
categories = [
    "Database"
]
tags = [
    "InfluxDB",
]
image = "100.jpg"
+++



    返回具有最新时间戳的点
    ORDER BY time DESC
    
    時間格式
    --precision rfc3339
    
    在查詢語句的最後加上tz('Asia/Shanghai')，這樣查詢的時間纔是糾正爲中國時區顯示 tz('Asia/Taipei')
    tz('Asia/Shanghai')
    
    查詢某個時間返回的數據，設置時區爲上海時區
    select * from CPU_ALL where time >= '2018-11-23 14:30:39' and time <= '2019-11-23 14:32:32' tz('Asia/Shanghai')
    
    查詢特定字段數據
    SELECT * FROM "cpu" WHERE time < now() - 5m and "cpu" =~ /cpu0/
    
    创建measurement
    insert myapp,host=127.0.0.1,service=app.service.index qps=1340,rt=1313,cpu=45.23,mem="4145m",load=1.21 
    
    查看使用者
    SHOW USERS
    
    刪除使用者
    DROP USER "admin-mysql"	
    
    新增使用者
    CREATE USER jdoe WITH PASSWORD '1337password'
    
    新增使用者並給予最高權限
    CREATE USER jdoe WITH PASSWORD '1337password' WITH ALL PRIVILEGES
    
    取消使用者最高權限
    REVOKE ALL PRIVILEGES FROM "mysql-server"
    
    給予使用者讀mydb的權限
    GRANT READ ON mydb TO "mysql-server"
    
    查詢當前資料庫中含有的表
    SHOW MEASUREMENTS
    
    查看key數據
    SHOW series from pay
    
    刪除key
    DROP SERIES FROM  WHERE =''
    
    查看表中的TAG
    SHOW TAG KEYS FROM "system"
    
    查看表中的TAG-host
    SHOW TAG VALUES FROM "system" WITH KEY = "host" 
    
    查詢所有監控項目
    show field keys
    
    查詢當前資料庫下所有表的第一行記錄
    SELECT * FROM /.*/ LIMIT 1



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
