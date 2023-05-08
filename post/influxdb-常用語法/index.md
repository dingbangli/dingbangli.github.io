# InfluxDB - 常用語法



### 返回具有最新时间戳的点
    
```sql
ORDER BY time DESC
``` 

### 時間格式設置
    
```sql
--precision rfc3339
```
    
### 在查詢語句的最後加上tz('Asia/Shanghai')，這樣查詢的時間纔是糾正爲中國時區顯示 tz('Asia/Taipei')
    
```sql
tz('Asia/Shanghai')
```
    
### 查詢某個時間返回的數據，設置時區爲上海時區
    
```sql
select * from CPU_ALL where time >= '2018-11-23 14:30:39' and time <= '2019-11-23 14:32:32' tz('Asia/Shanghai')
```
    
### 查詢特定字段數據
    
```sql
SELECT * FROM "cpu" WHERE time < now() - 5m and "cpu" =~ /cpu0/
```
    
### 創建 measurement
    
```sql
insert myapp,host=127.0.0.1,service=app.service.index qps=1340,rt=1313,cpu=45.23,mem="4145m",load=1.21 
```
    
### 查看使用者
    
```sql
SHOW USERS
```
    
### 刪除使用者
    
```sql
DROP USER "admin-mysql"	
```
    
### 新增使用者
    
```sql
CREATE USER jdoe WITH PASSWORD '1337password'
```
    
### 新增使用者並給予最高權限
    
```sql
CREATE USER jdoe WITH PASSWORD '1337password' WITH ALL PRIVILEGES
```
    
### 取消使用者最高權限
    
```sql
REVOKE ALL PRIVILEGES FROM "mysql-server"
```
    
### 給予使用者讀 mydb 的權限
    
```sql
GRANT READ ON mydb TO "mysql-server"
```
    
### 查詢當前資料庫中含有的表
    
```sql
SHOW MEASUREMENTS
```
    
### 查看 key 數據
    
```sql
SHOW series from pay
```
    
### 刪除 key
    
```sql
DROP SERIES FROM  WHERE =''
```    
    
### 查看表中的TAG
    
```sql
SHOW TAG KEYS FROM "system"
```
    
### 查看表中的TAG-host
    
```sql
SHOW TAG VALUES FROM "system" WITH KEY = "host" 
```
    
### 查詢所有監控項目
    
```sql
show field keys
```
    
### 查詢當前資料庫下所有表的第一行記錄
    
```sql
SELECT * FROM /.*/ LIMIT 1
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
> URL: https://laurance.eu.org/posts/influxdb-%E5%B8%B8%E7%94%A8%E8%AA%9E%E6%B3%95/  

