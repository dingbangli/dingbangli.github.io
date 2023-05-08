# MySQL - 如何配置 buffer pool


***
***

**{ 主要修改參數 }**
=====

***
***

**默認大小為 `128M` 健康比例為內存大小 `50%` (值越大 `IO讀寫` 就越少,數據讀寫就越快)**
   
```sql
innodb_buffer_pool_size
```

***
***

**一般取 `256M` 的倍數,並結合 `innodb_buffer_pool_size` 設置其大小 25%-50%**
    
```sql
innodb_log_file_size
```
    
***
***

**一般取 `16M` 的倍數**
    
```sql
innodb_log_buffer_size
```


***
***

**一般取 `innodb_buffer_pool_size` 的 50% 效果最優**
    
```sql
innodb_buffer_pool_instances
```
    
***
***
    
{{< admonition example >}}

### EX: 跑兩套 mysqld_multi  本機記憶體:31798M (32G)

***

```sql
innodb_buffer_pool_size = 8G 

innodb_log_buffer_size = 32M

innodb_log_file_size = 1G

innodb_flush_log_at_trx_commit = 2

innodb_buffer_pool_instances = 6

#innodb_file_format=barracuda

#innodb_file_format_max=barracuda

innodb_file_per_table=1
```

```sql
mysqladmin -uroot -p shutdown

mysqld_safe &
```    
{{< /admonition >}}

`配置完後 , 重啟服務生效`

***
***

{{< admonition example >}}

### 進入 mysql 查看配置是否正確

***

```sql
show variables where variable_name in ('innodb_buffer_pool_size', \

'innodb_buffer_pool_instances' ,\

'innodb_log_buffer_size' ,\

'innodb_log_file_size');
```

{{< /admonition >}}

***
***

{{< admonition example >}}

## 公式整理 : `percent` 必須 >= 95% 

***
    
```sql
percent = innodb_buffer_pool_read_requests / (innodb_buffer_pool_reads + innodb_buffer_pool_read_requests) * 100%
    
innodb_buffer_pool_pages_total = innodb_buffer_pool_size / innodb_page_size
    
percent = innodb_buffer_pool_pages_data / innodb_buffer_pool_pages_total * 100%
    
innodb_buffer_pool_size = innodb_buffer_pool_pages_data * innodb_page_size * 1.05 / (1024*1024*1024)
```

{{< /admonition >}}

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
> URL: https://laurance.eu.org/posts/mysql-%E5%A6%82%E4%BD%95%E9%85%8D%E7%BD%AEbuffer-pool/  

