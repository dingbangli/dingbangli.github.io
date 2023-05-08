# Nginx - Location 參數紀錄



***
***
    
**Location 的匹配模式**
----

| 符號 | 代表意思 |
| --- | --- |
| = | 精确匹配 |
| ～ | 正則匹配 , 大小寫敏感 |
| ～* | 正則匹配 , 大小寫不敏感 |
| ^~ | 忽略正則表達式的前綴匹配 |
|    | 沒有修飾符 , 前綴匹配 |
| @ | 命名 location , 可用來做內部重定向 |

***
***
 

{{< admonition example >}}

### 其中 `=` 和 `^~` 修饰符都可以認為是特殊形式的前缀匹配

{{< /admonition >}}


{{< admonition example >}}

```sql
    Location Example * :
    
        server {
            listen 80 default_server;
            server_name _;
            
            # A
            location = / {
                    return 200 "A";
            }
    
            # B
            location / {
                    return 200 "B";
            }
    
            # C
            location /docs {
                    return 200 "C";
            }
    
            # D
            location ^~ /imgs {
                    return 200 "D";
            }
            
            # E
            location ~* \.(gif|jpg|png)$ {
                    return 200 "E";
            }
    
            # F
            location ~ /a/.*$ {
                    return 200 "F";
            }
        }
```
    
{{< /admonition >}}

***
***
 
{{< admonition example >}}
    

    
|    	input		    |   		output			|  說明     |
|       ---             |           ---             |   ---     |    
|    	http://127.0.0.1	|	      A		    |   匹配到 A 跟 B  精确匹配优先级较高 |    
|    	http://127.0.0.1/test	|	  B		|       只匹配到B |
|    	http://127.0.0.1/docs/1		|  C	|	匹配到 B 跟 C , C 前缀比 B 长 |    
|    	http://127.0.0.1/docs/2.jpg	 | E	|	匹配到 B 、 C 、 E  正则匹配比普通前缀匹配优先级高 |
|    	http://127.0.0.1/imgs/1		|  D	|	只匹配到 B 、 D , D 前缀比 B 长 |    
|        http://127.0.0.1/imgs/1.jpg |	  D	|	匹配到 B 、 D 、 E ，由于 D 是最长匹配且有 ^~ 修饰符，所以不会再检查正则匹配 |
|    	http://127.0.0.1/docs/a/1	|   F	|	匹配到 B 、 C 、 F |
    	
    	
{{< /admonition >}}
 
 ***
 ***
     
**Location `@name` 的用法**
-----

{{< admonition example >}}
    
### `@` 前綴可以用來定義一個命名的 `location` 該 `location` 不處理正常的外部請求,一般用來供內部重定向使用。
    
### 它們不能嵌套,也不能包含嵌套的 `location`

{{< /admonition >}}
    
```sql
Location Example *
    
    location /try {
        try_files $uri $uri/ @name;
    }
    
    location /error {
        error_page 404 = @name;
        return 404;
    }
    
    location @name {
        return 200 "@name";
    }
```

***
    
## 這時訪問 `/try` 或者 `/error` 都會返回 `@name`



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
> URL: https://laurance.eu.org/posts/nginx-location-%E9%85%8D%E7%BD%AE/  

