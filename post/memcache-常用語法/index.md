# Memcache - 基本操作


***
***

| 參數名稱 | 作用 |
| ---- | ---- |
| command | add 、 set 或 replace |
| key | 緩存的名字 |
| flag | 16 位無符號整數，和 key 要存儲的數據一起存儲，並在程序 get 緩存時，返回 |
| exptime | 過去時間，0 表示永遠不過期 |
| bytes | 存儲數據的字節數 |
 | \r\n | 換行 Enter |

***
***

{{< admonition example >}}

格式

```sql
<command> <key> <flags> <exptime> <bytes>\r\n
    
<data block>\r\n
```
{{< /admonition >}}
       
***
***

**啟動服務**
-----

```sql
./memcached -d -m 2048 -u nobody  -p 12000 -c 2048 -P /tmp/memcached.pid
```

***
***

**連接 memcache**
-----
    
```sql
telnet 127.0.0.1 12000
```

`linux 下一般用 telnet 連接`

***
***
    
**添加緩存**
-----

```sql
add kk 1 0 4  	        #Enter

1234  		        #Enter
    
STORED
```

`如果 key 已經存在，則會添加失敗。如果數據 不是 4 個字節 應該會提示數據錯誤`

***
***
    
**修改緩存**
-----

```sql
replace kk 1 0 2        #Enter
 
11  		        #Enter
    
STORED  
```

`key 存在時,成功 ； 不存在時,失敗`
    
***
***
    
**設置緩存**
-----

```sql
set kk 1 0 4  	        #Enter

1234 		        #Enter

STORED
```
    
***
***

**讀取**
-----

```sql
get kk

VALUE kk 1 4

1234
```

***
***
    
**刪除**
-----

```sql
delete kk 	        #Enter

DELETED
```

***
***
    
**清空所有缓存**
-----

```sql
flush_all  

OK
```

***
***
    
**查看缓存服務器狀態**
-----

```sql
stats
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
> URL: https://laurance.eu.org/posts/memcache-%E5%B8%B8%E7%94%A8%E8%AA%9E%E6%B3%95/  

