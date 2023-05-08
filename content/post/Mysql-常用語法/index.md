+++
author = "Hugo Authors"
title = "MySQL-常用語法"
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

{{< highlight html >}}

背景啟動
mysqld_safe &

停掉服務
mysqladmin -u root -p shutdown 

創建密碼
mysqladmin -u root password '密碼' 

列出該 database_name 所有資料表
mysqlshow -u user_name -p db_name

檢視伺服器埠
show global variables like 'port'; 

查詢ID
SHOW VARIABLES LIKE '%server_%'; 

忘記密碼時在my.cnf增加參數
[mysqld]  skip-grant-tables 
在mysql介面執行更改密碼
use mysql;
UPDATE user SET Password = password('123456') WHERE User = 'root'; 

檢查是否有支援 Partition
SHOW PLUGINS;
SELECT PLUGIN_NAME as Name, PLUGIN_VERSION as Version, PLUGIN_STATUS as Status FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_TYPE='STORAGE ENGINE';
若要關閉 partition 支援，可在 my.cnf 加上 skip-partition，再重新啟動

查看型號
mysql> select version(); 
或是在Linux介面執行
mysql -V

查看表的存储引擎
show create table proc \G

直接更改存储引擎
alter table UserConf engine=MyISAM;	

顯示數據表結構： 
describe 表名;

查看MySQL的時間
select now();

查看MySQL時區
show variables like "%time_zone%";

顯示哪個執行緒正在運行
SHOW PROCESSLIST;

顯示資料表的欄位 
show columns from 資料表名稱;

顯示user裡的資料
SELECT * FROM user \G

新增帳號
CREATE USER 'laurance'@'10.10.%.%' IDENTIFIED BY '123456';

給予全部權限
grant all on *.* to 'laurance'@'10.10.%.%';

修改使用者
update user set User='laurance' where User='root';

刪除使用者
drop user 'laurance'@'localhost';

查看使用者權限
show grants for 'laurance'@'localhost'; 

安裝MySQL密碼強度插件
INSTALL PLUGIN validate_password SONAME 'validate_password.so';

臨時改密碼強度規則
SET GLOBAL validate_password_policy=LOW;

查看密碼強度規則
show variables like 'validate_pass%';

查看密碼長度規則
select @@validate_password_length;

更換主從語法
change master to MASTER_HOST='10.10.10.10', MASTER_USER='laurance', MASTER_PASSWORD='123456', MASTER_LOG_FILE='log-bin.000018', MASTER_LOG_POS=815722;

查詢MySQL密碼
select * from mysql.user \G
將*開頭的亂碼貼到MD5解
https://www.cmd5.com/

重新設為預設資料庫
mysql_install_db --datadir=/var/lib/mysql/master01/ --user=mysql &

    新增 TABLE
    
    CREATE TABLE ithelp1007a(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class CHAR(1) NOT NULL,
    name CHAR(20) NOT NULL,
    score TINYINT UNSIGNED NOT NULL
    );

    插入 TABLE
    
    INSERT INTO ithelp1007a(class, name, score) VALUES
    ('A', 'Tom', 78),
    ('A', 'Mary', 25),
    ('A', 'John', 65),
    ('B', 'Hitomi', 95),
    ('B', 'Asami', 84),
    ('B', 'Keiko', 73);


{{< /highlight >}}

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
