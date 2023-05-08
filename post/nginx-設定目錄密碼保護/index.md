# Nginx - 設定目錄密碼保護


***
***

**首先需要建立一個密碼檔, 裡面包含了`使用者名稱` , 以及`加密了的密碼` , 如果系統有安裝 Apache, 可以用以下語法建立密碼檔:**

```sql
htpasswd -c /path/to/file/.htpasswd username
```

***
***

**如果沒有 htpasswd 指令可以使用, 那便要手動建立密碼檔, 密碼檔的格式如下:**

```sql
username:encrypted-password:comment
```

`username 是使用者名稱, 可以自行定義, 而 encrypted-password 則是加密的密碼`

***
***

**建立密碼檔**

```sql
vim /home/opencli/.htpasswd
```

***
***

**將要設定的`使用者名稱`及上面的`加密密碼`複製到檔案, 即以下格式:**

```sql
username:saoYYKpu2QSsA
```

***
***

**開啟 Nginx 的設定檔**

```sql
vim /etc/nginx/conf.d/default.conf
```

***
***

{{< admonition example >}}

### 假設我要設定密碼保護的目錄是 `/usr/share/nginx/html/admin` 在 server 段落加入以下幾行:
   
***
 
```sql
location /admin/ {
    auth_basic "Restricted";
    auth_basic_user_file /home/opencli/.htpasswd;
}
```

{{< /admonition >}}

***
***

**儲存檔案後需要重新啟動 `Nginx`**

```sql
systemctl restart nginx
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
> URL: https://laurance.eu.org/posts/nginx-%E8%A8%AD%E5%AE%9A%E7%9B%AE%E9%8C%84%E5%AF%86%E7%A2%BC%E4%BF%9D%E8%AD%B7/  

