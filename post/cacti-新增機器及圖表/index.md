# Cacti - 新增機器監控及圖表


<!--more-->
"如何將新建的 EC2 加入 Cacti 監控"

{{< admonition >}}
 # 1. 新建機器上面先安裝SNMP，並確保火牆有通 UDP 161 port
{{< /admonition >}}

```sql
yum install -y net-snmp  net-snmp-utils
```    
    
{{< admonition >}}    
 # 2. Cacti 頁面新增 Device >> Add
{{< /admonition >}}   
   
   ![](001.png)
   
   ---

{{< admonition >}}   
  # 3. Device 填入機器的 hostname 及監控協議
{{< /admonition >}}

   ![](002.png)
   
   ---
   
{{< admonition >}}   
  # 4. Datasource 新增要撈取的資料
{{< /admonition >}}   
   
   ![](003.png)
   
   ---
   
{{< admonition >}}   
  # 5. Graph Management 新增監控圖表
{{< /admonition >}}   
   
   ![](004.png)
   
   ---

{{< admonition >}}   
  # 6. Graph Trees 分類圖表群
{{< /admonition >}}   
   
   ![](005.png)
   
   ---
   
  
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
> URL: https://laurance.eu.org/posts/cacti-%E6%96%B0%E5%A2%9E%E6%A9%9F%E5%99%A8%E5%8F%8A%E5%9C%96%E8%A1%A8/  

