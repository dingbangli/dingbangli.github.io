# Postgresql - 常用指令


<!--more-->
PSQL 指令紀錄

***
***

### 連接到 POSTGRESQL 資料庫

```sql

su - postgres -c 'psql'
```

### 本地使用者連接 POSTGRESQL 資料庫
`添加環境變數 才能用 psql 連接`

```sql

psql -d postgres -U  user 
```

### 連接到另一台SERVER上的資料庫

```sql

psql -h 172.16.0.223 -U test1 -d testdb
```

---

### 建立使用者
`新建立的使用者預設只會繼承 public 角色中所開放的權限，其餘權限都沒有開放`

```sql

CREATE USER test WITH PASSWORD 'test';
```

### 禁止使用者登入

```sql

ALTER ROLE username WITH NOLOGIN;
```

### 設定使用者`test`擁有`public`預設權限 並有`讀取、插入、修改、刪除`新表的 預設權限

```sql

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO test;
```

### 設定使用者`test`擁有`public`預設權限 並有`使用`新sequences的 預設權限

```sql

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE ON SEQUENCES TO test;
```

### 把所有角色的 USAGE 權限收回

```sql

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
```

---

### 建立資料庫 `testdb` 

```sql

CREATE DATABASE testdb;
```

### 移除資料庫每個使用者都能登入的權限

```sql

REVOKE CONNECT ON DATABASE testdb FROM public;
```

### 指定可以登入的使用者 `pguser1, pguser2, pgreader`

```sql

GRANT CONNECT ON DATABASE testdb TO pguser1, pguser2, pgreader;
```

---

### 顯示最大連接數

```sql

show max_connections;
```

### 查看 `alter default privileges` 預設權限

```sql

\ddp
```

### 列出有效的 schema

```sql

\dn
```

### 查看表結構

```sql

\d table_name
```

### 列出當前資料庫所有表

```sql

\dt
```

### 離開

```sql

\q
```

參考:

http://www.enmalvi.com/2022/04/03/postgresql-sql/

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
> URL: https://laurance.eu.org/posts/postgresql-%E5%B8%B8%E7%94%A8%E6%8C%87%E4%BB%A4/  

