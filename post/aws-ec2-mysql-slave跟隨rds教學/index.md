# AWS - EC2 mysql-slave 跟隨 RDS


<!--more-->
"紀錄一下 EC2 使用 Mysql 跟隨 RDS 的語法"

{{< admonition >}}
```sql
CALL mysql.rds_set_configuration('binlog retention hours', 12);
    
show master status\G;
    
CALL mysql.rds_stop_replication;
show slave status\G;
    
mysql -e "show databases;" -uroot -p -hRDS-master連結位置 | grep -Ev "Database|XXX_mariadb|information_schema|innodb|mysql|performance_schema" | xargs mysqldump -uroot -p -hRDS-master連結位置 --databases > db.sql 
    
mysqldump -uroot -p mysql rds_configuration rds_global_status_history rds_global_status_history_old rds_heartbeat2 rds_history rds_replication_status rds_sysinfo slow_log_template > RDS_mysql.sql
    
rm -f /var/lib/mysql/mysql/rds*
rm -f [大寫英文字母開頭的目錄] [白字檔]
mysqld_save&
    
mysql -uking -p < db.sql
    
mysql -uking -p mysql < RDS_mysql.sql
    
CHANGE MASTER TO MASTER_HOST='RDS-master連結位置', MASTER_USER='主從帳號', MASTER_PASSWORD='主從密碼';  ----跟隨RDS-master
CHANGE MASTER TO MASTER_LOG_FILE = 'bin-log檔名',MASTER_LOG_POS =進度;
start slave;
show slave status\G;
```
    
{{< /admonition >}}


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
> URL: https://laurance.eu.org/posts/aws-ec2-mysql-slave%E8%B7%9F%E9%9A%A8rds%E6%95%99%E5%AD%B8/  

