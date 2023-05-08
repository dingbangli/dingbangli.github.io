# Debian - 網卡設定


{{< admonition >}}
# 編輯網卡設定檔

```sql
vi /etc/network/interfaces


    auot eth0
    
    iface eth0 inet static
    
    address 192.168.2.66
    
    netmask 255.255.255.0
    
    gateway 192.168.2.254

```
{{< /admonition >}}

{{< admonition >}}
# 重啟網卡

    /etc/init.d/networking restart
    
# 查看 IP

    ip a
    
    ifconfig
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
> URL: https://laurance.eu.org/posts/debian-%E7%B6%B2%E5%8D%A1%E8%A8%AD%E5%AE%9A/  

