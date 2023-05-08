# Nginx - Proxypass (範例)


***
***

**NGINX 開 port:1515 導向 HUGO-localhost:1313 範例**
=====

***
***


```sql
server {

    listen 1515;
    listen [::]:1515;
#    server_name ;

        location  / {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_redirect off;
        proxy_http_version 1.1;
        proxy_pass http://127.0.0.1:1313;
        proxy_set_header X_FORWARDED_HOST $host;
        proxy_set_header Host $http_host;
        proxy_ignore_client_abort on;
        proxy_read_timeout 300;

        proxy_ignore_headers "Cache-Control";
        add_header X-Cache "$upstream_cache_status from $server_addr";
        add_header Cache-Control  max-age=60;
        proxy_cache_valid  304 1m;
#       proxy_cache two;
        proxy_cache_key $host$uri$is_args$args;
  }
    access_log logs/hugo-server/hugo-server.acc access;
}
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
> URL: https://laurance.eu.org/posts/nginx-proxypass-hugo/  

