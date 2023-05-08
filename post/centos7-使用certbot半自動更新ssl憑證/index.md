# CentOS7 - 使用 certbot 半自動更新 SSL 憑證


{{< admonition >}}
   
 # 下載 certbot 腳本
   
```sql

wget https://raw.githubusercontent.com/certbot/certbot/7f0fa18c570942238a7de73ed99945c3710408b4/letsencrypt-auto-source/letsencrypt-auto -O /root/certbot-auto

``` 

{{< /admonition >}}

{{< admonition >}}
   
# 給予權限
   
```sql

chmod 755 /root/certbot-auto

```

{{< /admonition >}}

{{< admonition >}}   
 
 # 使用 certbot-auto 簽發三個月憑證
   

## (保護 domain 及 sub domain)

```sql

./certbot-auto certonly -d “*.域名”-d “域名” --manual --preferred-challenges dns

```
    
## (只保護 sub domain) 

```sql

./certbot-auto certonly -d *.域名 --manual --preferred-challenges dns

```

{{< /admonition >}}

{{< admonition >}}    
   
# 驗證解析
   
```sql

nslookup -type=TXT _acme-challenge.XXXXX.net 8.8.8.8

```
 
{{< /admonition >}}

{{< admonition >}}  
   
 # 驗證過後會有4隻pem 路徑: /etc/letsencrypt/archive/
   
```sql

cp fullchain1.pem /usr/local/web/nginx/conf/key/las/XXXXX.net.crt
    
cp privkey1.pem /usr/local/web/nginx/conf/key/las/XXXXX.net.key

```

{{< /admonition >}}

{{< admonition >}}    
   
# NGINX 重啟
   
```sql

/usr/local/web/nginx/sbin/nginx  -t
    
/usr/local/web/nginx/sbin/nginx  -s reload

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
> URL: https://laurance.eu.org/posts/centos7-%E4%BD%BF%E7%94%A8certbot%E5%8D%8A%E8%87%AA%E5%8B%95%E6%9B%B4%E6%96%B0ssl%E6%86%91%E8%AD%89/  

