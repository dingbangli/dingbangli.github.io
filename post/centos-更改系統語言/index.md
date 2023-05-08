# Centos - 更改系統語言


<!--more-->
"如何更改 CentOS 系統語言"

{{< admonition >}}
  # 更改系統引數
{{< /admonition >}}
 
```sql

vim /etc/locale.conf		# CentOS 7
LANG=“zh_CN.UTF-8”
source  /etc/locale.conf

---

    
vim /etc/sysconfig/i18n	        # CentOS6
LANG=“zh_CN.UTF-8”
source /etc/sysconfig/i18n
```    

 ## 重啟系統
    
```sql
reboot
````    


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
> URL: https://laurance.eu.org/posts/centos-%E6%9B%B4%E6%94%B9%E7%B3%BB%E7%B5%B1%E8%AA%9E%E8%A8%80/  

