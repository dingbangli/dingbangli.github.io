# Iptables - 永久關閉指令


    
### 查看防火牆狀態

```sql
service iptables status
```
    
### 永久性生效 (重啟不復原)
    
```sql
chkconfig iptables on   (開啟)
chkconfig iptables off  (關閉)
``` 
    
### 即時性生效 (重啟後復原)
    
```sql
service iptables start  (開啟)
service iptables stop   (關閉)
```
    
### 設置後重啟
  
```sql
reboot
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
> URL: https://laurance.eu.org/posts/iptables-%E6%B0%B8%E4%B9%85%E9%97%9C%E9%96%89%E6%8C%87%E4%BB%A4/  

