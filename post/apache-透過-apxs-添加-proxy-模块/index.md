# Apache - 透過 apxs 添加 proxy 模块


<!--more-->
必須內建了 mod_so 模塊，當初編譯時有編 --enable-so

## 查看所有模塊

```sql
/usr/local/web/apache2/bin/httpd -l
```

   ![](201.png)
   
## 進入proxy moudle 編碼目錄

```sql
cd /root/dbmonitor-case/dbmonitor/httpd-2.2.27/modules/proxy
````
    
   ![](202.png)
   
## 使用apxs進行編譯安裝

```sql
/usr/local/web/apache2/bin/apxs -i -c -a mod_proxy.c proxy_util.c
```

   ![](203.png)



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
> URL: https://laurance.eu.org/posts/apache-%E9%80%8F%E9%81%8E-apxs-%E6%B7%BB%E5%8A%A0-proxy-%E6%A8%A1%E5%9D%97/  

