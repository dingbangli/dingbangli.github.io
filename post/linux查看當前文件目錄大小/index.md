# Linux - 查看當前目錄大小語法 ( du )


***
***

### 查看當前文件目錄各個文件夾大小
    
```sql
du -h --max-depth=1 |sort -hr
```
   
***
***
 
### 查看指定目錄
    
```sql
du -h --max-depth=1 /path
```

***
***
    
### 查看當層目錄
    
```sql
du -h - .
```

***
***
    
### 深入到第一層目錄
    
```sql
--max-depth=1
```

***
***
    
### 查看當前目錄下user目錄的大小，并不想看其他目錄以及其子目錄
    
```sql
du -sh user
```

***
***
    
### 要通過以1024字節為單位顯示一個目錄樹及其每個子樹的磁盤使用情况
    
```sql
du -k /home/linux
```

***
***
    
### 以MB為單位顯示一個目錄樹及其每個子樹的磁盤使用情况
    
```sql
du -m /home/linux
```

***
***
    
### 以GB為單位顯示一個目錄樹及其每個子樹的磁盤使用情况
    
```sql
du -g /home/linux
```

***
***
    
### 列出當前目錄中的目錄名不包括xyz字符串的目錄的大小
    
```sql
du -h --exclude='*xyz*'
```

***
***
    
### 只顯示一個目錄樹的全部磁盤使用情况
    
```sql
du -s /home/linux
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
> URL: https://laurance.eu.org/posts/linux%E6%9F%A5%E7%9C%8B%E7%95%B6%E5%89%8D%E6%96%87%E4%BB%B6%E7%9B%AE%E9%8C%84%E5%A4%A7%E5%B0%8F/  

