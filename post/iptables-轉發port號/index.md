# Iptables - 轉發 PORT


    
   **將 80 PROT 轉向 8000 PORT**
-----
    
```sql
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8000
```
    
   **利用 OUTPUT 的規則，從本機連到自己**
   -----
    
```sql
iptables -t nat -A OUTPUT -p tcp -d localhost --dport 80 -j REDIRECT --to-ports 8000
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
> URL: https://laurance.eu.org/posts/iptables-%E8%BD%89%E7%99%BCport%E8%99%9F/  

