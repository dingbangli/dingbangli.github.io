# Iptables - 移除某一條規則


### 將規則用號碼列出,並篩出該IP
    
```sql
iptables -nL --line-number |grep 52.52.52.52
```
    
### 將該chain裡的第41行砍掉
    
```sql
iptables -D deny 41
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
> URL: https://laurance.eu.org/posts/iptables-%E7%A7%BB%E9%99%A4%E6%9F%90%E4%B8%80%E6%A2%9D%E8%A6%8F%E5%89%87/  

