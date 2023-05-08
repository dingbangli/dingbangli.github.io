# MySQL - 常用語法整理


***
***

**背景啟動**
---

```sql
mysqld_safe &
```

***
***

**停掉服務**
---

```sql
mysqladmin -u root -p shutdown 
```

***
***

**創建密碼**
---

```sql
mysqladmin -u root password '密碼' 
```

***
***

**列出該 database_name 所有資料表**
---

```sql
mysqlshow -u user_name -p db_name
```

***
***

**檢視伺服器埠**
---

```sql
show global variables like 'port'; 
```

***
***

**查詢 ID**
---

```sql
SHOW VARIABLES LIKE '%server_%'; 
```

***
***

**忘記密碼時在 `my.cnf` 增加參數**
---

```sql
skip-grant-tables
``` 

***
***

**在 mysql 介面執行更改密碼**
---

```sql
use mysql;

UPDATE user SET Password = password('123456') WHERE User = 'root'; 
```

***
***

**檢查是否有支援 `Partition`**
---

```sql
SHOW PLUGINS;

SELECT PLUGIN_NAME as Name, PLUGIN_VERSION as Version, PLUGIN_STATUS as Status FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_TYPE='STORAGE ENGINE';
```

{{< admonition example >}}

### 若要關閉 partition 支援，可在 my.cnf 加上 `skip-partition` 再重新啟動

{{< /admonition >}}

***
***

**查看版本 ( 在 `Mysql 介面` 執行 )**
---

```sql
mysql> select version(); 
```

**或是在 `Linux 介面` 執行**

```sql
mysql -V
```

***
***

**查看表的存储引擎**
---

```sql
show create table proc \G
```

***
***

**直接更改存储引擎**
---

```sql
alter table UserConf engine=MyISAM;	
```

***
***

**顯示數據表結構：**
---
 
```sql
describe 表名;
```

***
***

**查看 MySQL 的時間**
---

```sql
select now();
```

***
***

**查看 MySQL 時區**
---

```sql
show variables like "%time_zone%";
```

***
***

**顯示哪個執行緒正在運行**
---

```sql
SHOW PROCESSLIST;
```

***
***

**顯示資料表的欄位**
---
 
```sql
show columns from 資料表名稱;
```

***
***

**顯示user裡的資料**
---

```sql
SELECT * FROM user \G
```

***
***

**新增帳號**
---

```sql
CREATE USER 'laurance'@'10.10.%.%' IDENTIFIED BY '123456';
```

***
***

**給予全部權限**
---

```sql
grant all on *.* to 'laurance'@'10.10.%.%';
```

***
***

**修改使用者**
---

```sql
update user set User='laurance' where User='root';
```

***
***

**刪除使用者**
---

```sql
drop user 'laurance'@'localhost';
```

***
***

**查看使用者權限**
---

```sql
show grants for 'laurance'@'localhost'; 
```

***
***

**安裝 MySQL 密碼強度插件**
---

```sql
INSTALL PLUGIN validate_password SONAME 'validate_password.so';
```

***
***

**臨時改密碼強度規則**
---

```sql
SET GLOBAL validate_password_policy=LOW;
```

***
***

**查看密碼強度規則**
---

```sql
show variables like 'validate_pass%';
```

***
***

**查看密碼長度規則**
---

```sql
select @@validate_password_length;
```

***
***

**更換主從語法**
---

```sql
change master to MASTER_HOST='10.10.10.10', MASTER_USER='laurance', MASTER_PASSWORD='123456', MASTER_LOG_FILE='log-bin.000018', MASTER_LOG_POS=815722;
```

***
***

**查詢 MySQL 密碼**
---

```sql
select * from mysql.user \G
```

{{< admonition example >}}

**將 * 開頭的亂碼貼到 MD5 解**

https://www.cmd5.com/

{{< /admonition >}}

***
***

**重新設為預設資料庫**
---

```sql
mysql_install_db --datadir=/var/lib/mysql/master01/ --user=mysql &
```

***
***

**新增 TABLE 語法**
---
    
```sql
CREATE TABLE ithelp1007a(
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
class CHAR(1) NOT NULL,
name CHAR(20) NOT NULL,
score TINYINT UNSIGNED NOT NULL
);
```

***
***
    
**插入 TABLE 語法**
---
    
```sql
INSERT INTO ithelp1007a(class, name, score) VALUES
('A', 'Tom', 78),
('A', 'Mary', 25),
('A', 'John', 65),
('B', 'Hitomi', 95),
('B', 'Asami', 84),
('B', 'Keiko', 73);
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
> URL: https://laurance.eu.org/posts/mysql-%E5%B8%B8%E7%94%A8%E8%AA%9E%E6%B3%95/  

