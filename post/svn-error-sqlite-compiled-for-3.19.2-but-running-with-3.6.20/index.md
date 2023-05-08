# SVN - error - SQLite compiled for 3.19.2, but running with 3.6.20


***
***

**svn: SQLite compiled for 3.19.2, but running with 3.6.20**
    
```sql
svn: E200029: Couldn't perform atomic initialization

svn: E200030: SQLite compiled for 3.19.2, but running with 3.6.20
```
    
**這是因為編譯 SVN 用的版本 `sqlite 3.19.2` 和系統中已安裝的 `sqlite 3.6.20` 版本不一致導致**

***
***
    
**解決方法**
=====

***
***

**從輸出中看出目前使用的 `sqlite 版本`**

```sql
cd /usr/local/svn/bin

ldd svn
```

```sql
libsqlite3.so.0 => /usr/lib64/libsqlite3.so.0 (0x00007f0f8572d000)
```

***
***

**找到 `libsqlite3.so.0` 並將它從新 link**

```sql
find / -name libsqlite3.so.0 -print


/usr/local/sqlite/lib/libsqlite3.so.0

/usr/local/sqlite-autoconf-3190200/.libs/libsqlite3.so.0

/usr/local/lib/libsqlite3.so.0

/usr/lib64/libsqlite3.so.0
```

```sql
mv libsqlite3.so.0 libsqlite3.so.0.old

ln -s /usr/local/lib/libsqlite3.so.0 libsqlite3.so.0
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
> URL: https://laurance.eu.org/posts/svn-error-sqlite-compiled-for-3.19.2-but-running-with-3.6.20/  

