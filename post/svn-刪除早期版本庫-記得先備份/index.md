# SVN - 刪除早期版本庫 (記得先備份!!!)


<!--more-->
svn-dump 太肥導致硬碟爆了,因此決定瘦身一下

***
***

**查看目前版本號**
    
```sql
svnlook youngest /home/svn/mis-note
```

***
***

**保留 `130-138 版本號` 的 dump**
   
```sql
svnadmin dump /home/svn/mis-note -r 130:138 > repo_dump_130-138.dmp 2>repo_dump_130-138.log
```

***
***
    
**將舊的庫移成 `XXX.bak`**
   
```sql
mv mis-note/ mis-note-20230105.bak/
```

***
***
    
**建立新庫**
   
```sql
svnadmin create /home/svn/mis-note
```

***
***

**將設定檔複製過來**
   
```sql
cp -r ../mis-note-20230105.bak/conf .
```

***
***

**查看乾淨庫的容量**
   
```sql
du -hs mis-note
```

***
***
    
**導入 dump**
   
```sql
svnadmin load /home/svn/mis-note < repo_dump_130-138.dmp >repo_load_130-138.log 2>repo_load_130-138.errlog
```

***
***
    
**看一下新庫容量有沒有增加**
   
```sql
du -hs mis-note
```

***
***

**svn-server 重啟**

```sql
pkill svnserve

svnserve -d /usr/local/bin/svnserve --daemon --pid-file=/var/run/svnserve.pid

```

{{< admonition example >}}

**Client 端 (Windows): 砍掉舊有的SVN資料夾 , 並取出新資料夾**

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
> URL: https://laurance.eu.org/posts/svn-%E5%88%AA%E9%99%A4%E6%97%A9%E6%9C%9F%E7%89%88%E6%9C%AC%E5%BA%AB-%E8%A8%98%E5%BE%97%E5%85%88%E5%82%99%E4%BB%BD/  

