# Linux - History 增加時間顯示


***
***

**臨時添加**
-----

```sql
exprt HISTTIMEFORMAT=’%F %T ’
```

***
***
    
**永久套用**
-----

 ```sql
 vim ~/.bashrc
 

HISTTIMEFORMAT="%F %T "
source .bashrc
``` 

***
***
   
**寫入 /etc/profile 達到全體套用**
-----

```sql
vim /etc/profile


HISTTIMEFORMAT="%F %T "
    
source /etc/profile
```    

***
***

**Shell 執行的方法**
-----

```sql
echo 'HISTTIMEFORMAT="%F %T "' >> /etc/profile

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
> URL: https://laurance.eu.org/posts/linux-history%E5%A2%9E%E5%8A%A0%E6%99%82%E9%96%93%E9%A1%AF%E7%A4%BA/  

