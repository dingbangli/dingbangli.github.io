+++
author = "Hugo Authors"
title = "Nginx-log_format配置"
date = "2022-08-03"
#description = ""
categories = [
    "Web"
]
tags = [
    "Nginx",
]
image = "100.png"
+++



    引數                      說明                                          示例
    
    $remote_addr             客戶端地址                                     192.168.122.1
    
    $remote_user             客戶端使用者名稱稱                             --
    
    $time_local              訪問時間和時區                                 17/Dec/2018:10:47:58 +0800
    
    $request                 請求的URI和HTTP協議                            "GET / HTTP/1.1"
    
    $status                  HTTP請求狀態                                     304
    
    $upstream_status         upstream狀態                                     0
    
    $body_bytes_sent         傳送給客戶端檔案內容大小                         -
    
    $http_referer            url跳轉來源,用於記錄是從哪個頁面連結訪問過來的                                   
    
    $http_user_agent         使用者終端瀏覽器等資訊,即客戶瀏覽器的相關資訊     "Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0"
    
    
    $http_host               請求地址，即瀏覽器中你輸入的地址（IP或域名）       www.wang.com 192.168.100.100
    
    $ssl_protocol            SSL協議版本                                        TLSv1
    
    $ssl_cipher              交換資料中的演算法                                 RC4-SHA
    
    $upstream_addr           後臺upstream的地址，即真正提供服務的主機地址       10.10.10.100:80
    
    $request_time            整個請求的總時間                                   0.205
    
    $upstream_response_time  請求過程中，upstream響應時間                       0.002
    
    $http_x_forwarded_for	客户端的真实ip 如果包含多個IP 
    [ X-Forwarded-For: client1, proxy1, proxy2, ... ]



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
