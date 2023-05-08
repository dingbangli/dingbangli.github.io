# SVN - SERVER - 安裝教學 (CentOS7)


***
***

**安裝依賴及 SVN 套件**

```sql
yum install apr* gcc zlib-devel automake autoconf libtool make

wget https://archive.apache.org/dist/subversion/subversion-1.10.8.tar.gz
    
tar zxvf subversion-1.10.8.tar.gz
    
cd subversion-1.10.8
    
mkdir sqlite-amalgamation

cd ../

wget https://www.sqlite.org/2022/sqlite-autoconf-3400000.tar.gz --no-check-certificate
 
tar zxvf sqlite-autoconf-3400000.tar.gz
    
cd subversion-1.10.8/sqlite-amalgamation
    
cp -r ../../sqlite-autoconf-3400000/* .
```

***
***

**編譯安裝 svn-server**

```sql
cd ../

./configure --prefix=/usr/local/svn --without-berkeley-db --with-lz4=internal --with-utf8proc=internal

make && make install
 
cp /usr/local/svn/bin/* /usr/local/bin/
```

***
***
    
**啟動 svnserve**

```sql
svnserve -d /usr/local/bin/svnserve --daemon --pid-file=/var/run/svnserve.pid
```

***
***

**增加 svn 啟動身分**
 
```sql
adduser svn

passwd svn
```

***
***
    
**建立資料庫**

```sql
svnadmin create /home/svn/project/
```

***
***
    
**增加使用者與密碼**

```sql
vim /home/svn/project/conf/passwd
```
    
```sql
[users]

laurance = yoyoyo
```

***
***

**增加權限**

```sql
vim /home/svn/project/conf/auth
```

```sql
[/]
laurance = rw
``` 

***
***
    
**修改設定檔**

```sql
vim /home/svn/project/conf/svnserve.conf
```

```sql
[general]

anon-access=read

auth-access=write

password-db=passwd

authz-db=authz

realm=/home/svn/nowblog

[sasl]
```

***
***

**重啟 svn-server**

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
> URL: https://laurance.eu.org/posts/svn-%E5%AE%89%E8%A3%9D%E6%95%99%E5%AD%B8-centos7/  

