+++
author = "Hugo Authors"
title = "Docker-Error-requested access to the resource is denied"
date = "2022-09-13"
description = "上傳鏡像被拒絕 Denied"
categories = [
    "Docker"
]
tags = [
    "Docker",
]
image = "100.png"
+++

    上傳 image 報錯
    
    docker push laurance/green
    
    denied: requested access to the resource is denied
    
   ![](000001.png)
   
   **解决方案**
   
    docker tag laurance/green ihatemis/green
    
    ihatemis 為 Docker hub 用戶名
    
   ![](000002.png)
   
    後台查看已上傳
    
   ![](0000003.png)
   
   
   
    

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
