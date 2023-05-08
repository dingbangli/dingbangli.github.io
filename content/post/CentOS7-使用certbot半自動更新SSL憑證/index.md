+++
author = "Hugo Authors"
title = "CentOS7-使用certbot半自動更新SSL憑證"
date = "2022-12-10"
#description = ""
categories = [
    "Linux"
]
tags = [
    "CentOS",
]
image = "100.png"
+++

   下載 certbot 腳本
   
    wget https://raw.githubusercontent.com/certbot/certbot/7f0fa18c570942238a7de73ed99945c3710408b4/letsencrypt-auto-source/letsencrypt-auto -O /root/certbot-auto
    
   給予權限
   
    chmod 755 /root/certbot-auto
    
   使用 certbot-auto 簽發三個月憑證
   
    (保護 domain 及 sub domain)
    
    ./certbot-auto certonly -d “*.域名”-d “域名” --manual --preferred-challenges dns
    
    (只保護 sub domain) 
    
    ./certbot-auto certonly -d *.域名 --manual --preferred-challenges dns
    
   驗證解析
   
    nslookup -type=TXT _acme-challenge.XXXXX.net 8.8.8.8
    
   驗證過後會有4隻pem 路徑: /etc/letsencrypt/archive/
   
    cp fullchain1.pem /usr/local/web/nginx/conf/key/las/XXXXX.net.crt
    
    cp privkey1.pem /usr/local/web/nginx/conf/key/las/XXXXX.net.key
    
   NGINX 重啟
   
    /usr/local/web/nginx/sbin/nginx  -t
    
    /usr/local/web/nginx/sbin/nginx  -s reload
    

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
