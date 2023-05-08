# Nginx - 參數配置 tri_files $uri


<!--more-->
進行內部重定向 URI 的 nginx 參數

***
***

**按指定順序檢查文件是否存在，並使用第一個找到的文件進行請求處理**
=====

***
***

## **配置**

```sql
try_files $uri  $uri/ /index.html;
```

***
    
## **`$uri`  這個是 nginx 的一個變量，存放著用戶訪問的地址**

***

{{< admonition example >}}

### EX： `http://www.xxx.com/index.html` 那麼 `$uri` 就是 `/index.html`

{{< /admonition >}}

***
***

## **`$uri/` 代表訪問的是一個目錄**

***

{{< admonition example >}}

### EX： `http://www.xxx.com/hello/test/` 那麼 `$uri/` 就是 `/hello/test/`

{{< /admonition >}}

***
***


{{< admonition example >}}

### 比如用戶訪問這個網地址     http://www.xxx.com/test.html
        
### `try_files` 首先會判斷他是文件，還是一個目錄，結果發現他是文件，與第一個參數 `$uri` 變量匹配
        
### 然後去到網站目錄下去查找 `test.html` 文件是否存在，如果存在直接讀取返回。如果不存在就跳去匹配 `$uri/`
    
### 如果 `$uri/ ` 不存在則匹配原路徑底下 `/index.html`

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
> URL: https://laurance.eu.org/posts/nginx-%E5%8F%83%E6%95%B8-tri_files-uri/  

