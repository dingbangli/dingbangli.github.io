+++
author = "Hugo Authors"
title = "PHPstorm-IDEKEY 連接方式"
date = "2022-10-17"
#description = ""
categories = [
    "PHPstorm"
]
tags = [
    "PHPstorm",
]
image = "100.png"
+++

    1.	新增一個New Project
    
   ![](000001.png)
   
    2.	直接按下 Create >> Open in new window >> OK
    
   ![](000002.png)
   
    3.	打開遠端部署（Development）設定介面
    
   ![](000003.png)
   
    4.	按下 + >> Name >> Type: SFTP
    
   ![](000004.png)
   
    5.	測試IDE登入 再按Test SFTP connection 即可
    
            SFTP host: IP
            Port : 22
            Root path: /
            User name: jimide
            Auth type: OpenSSH or Putty
            Private key file: admin-jimide.pem

    
   ![](000005.png)
   
   ![](000006.png)

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
