# Docker - Install docker-compose


{{< admonition >}}

# **下載安裝包**

```sql

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

```

{{< /admonition >}}

{{< admonition >}}   

# **對二進製文件應用可執行權限**

```sql

sudo chmod +x /usr/local/bin/docker-compose

```

{{< /admonition >}}

{{< admonition >}}
    
# **創建指向 /usr/bin 或路徑中任何其他目錄的符號鏈接**

```sql

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

```

{{< /admonition >}}

{{< admonition >}}    

# **測試 docker-compose**

```sql

docker-compose --version

```

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
> URL: https://laurance.eu.org/posts/docker-install-docker-compose/  

