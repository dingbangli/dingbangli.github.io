# Postgresql - install postgresql-14.7 on centos7


<!--more-->
自行編譯低版本 PSQL-14.7

***
***

**安裝依賴套件**

```sql
yum install gcc gcc-c++ readline-devel zlib-devel openssl openssl-devel

```

***
***

**下載安裝 cmake編譯器**

```sql
wget -t 0 https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1.tar.gz

tar zxf cmake-3.23.1.tar.gz

cd cmake-3.23.1

./bootstrap && gmake && gmake install

cmake --version

```  

***
***

**下載 `postgresql-14.7 tar包`**

```sql
wget https://ftp.postgresql.org/pub/source/v14.7/postgresql-14.7.tar.gz --no-check-certificate

tar zxf postgresql-14.7.tar.gz

cd postgresql-14.7

./configure --prefix=/var/lib/postgresql

make && make install

``` 

***
***

**新增 `postgres` 使用者來執行 DB**

```sql
useradd postgres

```

***
***

**建立存放資料及 LOG 的位置並給予權限 `for postgres`**

```sql
cd /var/lib/postgresql/

mkdir data

mkdir log

chown -R postgres.postgres /var/lib/postgresql

``` 

***
***
   
**添加 `psql環境變數`**

```sql
su - postgres -c "vim ~/.bash_profile"

```
```sql
export PGHOME=/var/lib/postgresql

export PGDATA=/var/lib/postgresql/data

export PATH=$PATH:$JAVA_HOME/bin:$PGHOME/bin

```

***
***

**初始化資料庫及指定存放資料位置**

```sql
su - postgres -c "/var/lib/postgresql/bin/initdb -D /var/lib/postgresql/data/"

```

***
***

**更改設定檔 && 設定監聽位置**

```sql
vim /var/lib/postgresql/data/postgresql.conf

```

```sql
listen_addresses = '*' 
	
port = 5432 

```

***
***

**設定 `使用者` 及 `IP段`**

```sql
vim /var/lib/postgresql/data/pg_hba.conf

```
```sql
host    all             rd              10.140.0.0/16           password

```

***
***

**切換使用者 && 啟動 PostgreSQL**

```sql
su - postgres -c "/var/lib/postgresql/bin/pg_ctl start -l /var/lib/postgresql/log/pg_server.log"

```

***
***

**切換使用者 && 重啟 PostgreSQL**

```sql
su - postgres -c "/var/lib/postgresql/bin/pg_ctl restart"

```

***
***

**切換使用者 && 建立 `超級使用者帳號`**

```sql
su - postgres -c "createuser -s -i -d -l -r king"

```

***
***

{{< admonition example >}}

**常用參數**

| 參數 | 參數代表意思 |
| --- | --- |
| -s , --superuser | 新使用者將是超級使用者 |
| -i , --inherit | 新角色將自動繼承其所屬角色的權限。這是預設值 |
| -d , --createdb | 將允許新使用者建立資料庫 |
| -l , --login | 將允許新使用者登入（即，使用者名稱可以用作初始連線使用者）這是預設值 | 
| -r , --createrole | 將允許新使用者建立新角色（即，此使用者將具有 CREATEROLE 權限） |

{{< /admonition >}}

    
**切換使用者 && 建立 `普通使用者`**

```sql
su - postgres -c "createuser -d -l -P rd"

```

`ps : -p , --pwprompt 如果有此選項，createuser 將發出新使用者密碼的提示。如果您不打算使用密碼身份驗證，則毌須執行此操作。`

***
***
    
**切換使用者 && 進入 `psql cmd`**

```sql
su - postgres -c "psql"

```

***
***

**設定使用者 `rd` 對 `public` 新 `Sequences` 的預設權限**

```sql
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE ON SEQUENCES TO rd;
```

***
***

**設定使用者 `rd` 對 `public` 新 `表` 的預設權限**

```sql
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE ON TABLES TO rd;
```

`ps : 要先建立 database 才能用使用者連線`

***
***

**官方 yum 安裝: https://jovepater.com/article/centos-7-postgresql-14-installation/**

**參考: https://pjchender.dev/database/psql-roles-privilege/**

**參考: https://blog.csdn.net/zou8944/article/details/121528128**




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
> URL: https://laurance.eu.org/posts/postgresql-%E5%AE%89%E8%A3%9Dpostgresql-14.7-on-centos7/  

