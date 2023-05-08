# Linux - history 命令保存的最大數


***
***

**~/.bash_history 裡面紀錄的是上一次登出的歷史紀錄 (默認保存1000條)**
=====

***
***
    
**查看目前保留配置**
------
    
```sql
echo $HISTSIZE
```

***
***
    
**修改環境變量 (永久配置)**
------
   
```sql
sed -i 's/^HISTSIZE=1000/HISTSIZE=100000/' /etc/profile
source /etc/profile
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
> URL: https://laurance.eu.org/posts/linux-history%E5%91%BD%E4%BB%A4%E4%BF%9D%E5%AD%98%E7%9A%84%E6%9C%80%E5%A4%A7%E6%95%B8/  

