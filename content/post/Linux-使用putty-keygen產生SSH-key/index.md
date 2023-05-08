+++
author = "Hugo Authors"
title = "Linux-使用PuTTYgen產生SSH連線key"
date = "2022-08-03"
#description = ""
categories = [
    "ssh-keygen"
]
tags = [
    "ssh-keygen",
]
image = "100.png"
+++



    新增帳號+ide
    useradd XXXide
    su - XXXide
    ssh-keygen
    
    一路按Enter
    cd /home/XXXide/.ssh/
    
    使用putty-keygen.exe 製作 authorized_keys內容
    按下Generate (滑鼠在進度調上游移會快一點)
    
    跑完後 複製上面的內容貼進帳號的.ssh/authorized_keys再給權限600
    chmod 600 .ssh/authorized_keys
    
    按下save pubilc key 儲存檔案 andyide.pub
    按下save private key 儲存檔案 andyide.ppk
    (若PPK連不進去，可以將PPK轉PEM) >> 先import_key *.ppk 後在 Export_key *.pem
    
    再將帳號登入權限的bash拿掉
    vim  /etc/passwd 	/bin/bash >>/sbin/nologin



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
