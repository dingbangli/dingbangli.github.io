+++
author = "Hugo Authors"
title = "PHP-開啟及關閉錯誤訊息輸出"
date = "2022-12-03"
#description = ""
categories = [
    "Web"
]
tags = [
    "PHP",
]
image = "100.png"
+++

   開啟錯誤提示
   
    display_errors = On
    
   關閉錯誤提示
   
    display_errors = Off
    
   輸出全部錯誤
   
    error_reporting E_ALL
    
   除了 Notice 外，全部錯誤輸出
   
    error_reporting E_ALL & ~E_NOTICE
    
   不輸出任何錯誤
   
    error_reporting 0 
    
   

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
