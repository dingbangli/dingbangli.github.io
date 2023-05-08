# Fortinet - FortiGate60E SSL匯入自簽3個月憑證


<!--more-->
"( SSL-VPN 匯入 PKCS12 憑證 )"

{{< admonition >}}

# 使用certbot-auto簽發三個月憑證,並驗證TXT

{{< /admonition >}}
   
   ![](001.png)

---

{{< admonition >}}

# 將兩隻key丟到nginx目錄測試(fullchain1.pem >> XXX.crt , privkey1.pem >> XXX.key)

{{< /admonition >}}
   
   ![](003.png)

---

{{< admonition >}}
   
# Nginx重啟reload

{{< /admonition >}}
   
   ![](004.png)

---

{{< admonition >}}
   
# 將解析綁到本機hosts

 {{< /admonition >}}
    
   ![](005.png)
  
  ---
  
 {{< admonition >}}
   
# 開啟剛剛設置的域名,查看憑證是否設定正確

{{< /admonition >}}
   
   ![](006.png)

---

{{< admonition >}}
   
# 使用openssl將兩隻key合併生成XXX.pfx (fortigate支援的格式) ps.會強制設定密碼

{{< /admonition >}}
   
   ![](007.png)

---

{{< admonition >}}
   
# 將剛剛製作的憑證XXX.pfx上傳至fortigate後台,並輸入剛剛設置的密碼

{{< /admonition >}}
   
   ![](009.png)

---

{{< admonition >}}
   
# Fotigate後台,SSL-VPN設定這邊的伺服器憑證選單裡就會出現剛剛設置的三個月憑證

{{< /admonition >}}
   
   ![](010.png)

---

{{< admonition >}}
   
# 驗證查看 >> 已出現剛剛製作的憑證

{{< /admonition >}}
   
   ![](011.png)

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
> URL: https://laurance.eu.org/posts/fortinet-fortigate60e-ssl%E5%8C%AF%E5%85%A53%E5%80%8B%E6%9C%88%E6%86%91%E8%AD%89/  

