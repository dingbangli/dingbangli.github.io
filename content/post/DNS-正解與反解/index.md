+++
author = "Hugo Authors"
title = "DNS-正解與反解"
date = "2022-08-03"
#description = ""
categories = [
    "Web"
]
tags = [
    "DNS",
]
image = "100.png"
+++



    DNS正解／反解 ：主要是來說明〝IP位置〞與〝網址〞之間關連的狀況。
    
    ●DNS正解：是指〝網址〞對應到〝主機IP〞的關連狀況，亦為使用者在DNS Server上，透過A 指向、MX 指向、TXT指向、NS指向的設定，用來表示連結網址時會通到的IP位置的主機；或是寄信時該投遞到主機位置
    
    ●DNS反解：是指 IP 位址對映到主機的關連狀況，亦為IP透過PTR指向設定，用來表示IP對應到的網址，這個通常是設定伺服器名稱hostname，一般搭配正解的設定來達到驗證效果，如：MAIL的收信方會檢查發信IP 之反解設定是否與正解的NS指向一致；或系統有驗證到反解的訊息才會寄出系統通知信件…等
    
    正解／反解 的設定對象為何>>
    
    ●正解需求的設定對象：為網址的擁有者。
    ●反解需求的設定對象：有ROOT權限的主機商。




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
