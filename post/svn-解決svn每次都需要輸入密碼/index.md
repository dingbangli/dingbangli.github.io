# SVN - Linux 解決每次 commit 都需要輸入密碼


***
***

**刪除原本緩存密碼的文件**

```sql
rm -f ~/.subversion/auth/svn.simple/*
```

***
***
    
**執行一次 "svn update" 讓密碼緩存文件重新生成**

```sql
cd nowblog-2023-02-08/ 
    
svn up --username laurance
```

***
***
    
**修改緩存目錄下的文件**

```sql
vim ~/.subversion/auth/svn.simple/1b47431ba1edd4463343286aca5a7e1
```
    
```sql
K 15
svn:realmstring
V 43
<svn://192.168.168.1:3690>
K 8
passtype
V 6
simple
K 8
username
V 8
laurance
K 8
password
V 10
XXXXXX   (password)
END
```

***
***

**{ `passtype` 固定是 `simple`  ,  `K` 和 `V` 後面的數字分別代表 `key` 和 `value` 的長度 }**
=====

***
***

[參考文件](https://blog.csdn.net/u013304850/article/details/124821651)

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
> URL: https://laurance.eu.org/posts/svn-%E8%A7%A3%E6%B1%BAsvn%E6%AF%8F%E6%AC%A1%E9%83%BD%E9%9C%80%E8%A6%81%E8%BC%B8%E5%85%A5%E5%AF%86%E7%A2%BC/  

