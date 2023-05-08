+++
author = "Hugo Authors"
title = "Fortinet-FortiGate60E SSL匯入自簽3個月憑證"
date = "2022-09-20"
description = "(SSL-VPN匯入PKCS12憑證)"
categories = [
    "FortiGate"
]
tags = [
    "FortiGate",
]
image = "100.png"
+++


    1. 使用certbot-auto簽發三個月憑證,並驗證TXT
   ![](001.png)
   
    2. 將兩隻key丟到nginx目錄測試(fullchain1.pem >> XXX.crt , privkey1.pem >> XXX.key)
   ![](003.png)
   
    3. Nginx重啟reload
   ![](004.png)
   
    4. 將解析綁到本機hosts
   ![](005.png)
   
    5. 開啟剛剛設置的域名,查看憑證是否設定正確
   ![](006.png)
   
    6. 使用openssl將兩隻key合併生成XXX.pfx (fortigate支援的格式) ps.會強制設定密碼
   ![](007.png)
   
    7. 將剛剛製作的憑證XXX.pfx上傳至fortigate後台,並輸入剛剛設置的密碼
   ![](009.png)
   
    8. Fotigate後台,SSL-VPN設定這邊的伺服器憑證選單裡就會出現剛剛設置的三個月憑證
   ![](010.png)
   
    9. 驗證查看 >> 已出現剛剛製作的憑證
   ![](011.png)

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
