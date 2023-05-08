+++
author = "Hugo Authors"
title = "HTTP-常見狀態錯誤碼"
date = "2022-08-03"
#description = ""
categories = [
    "Web"
]
tags = [
    "HTTP",
]
image = "100.jpg"
+++



    ---------------------------
    資訊回應 	(100–199),
    成功回應 	(200–299),
    重定向 		(300–399),
    用戶端錯誤 	(400–499),
    伺服器端錯誤 	(500–599).
    ---------------------------
    
    100	此臨時回應表明，目前為止的一切完好，而用戶端應當繼續完成請求
    101	此狀態碼乃為用戶端 Upgrade (en-US) 請求標頭發送之回應、且表明伺服器亦切換中。
    102	此狀態碼表明伺服器收到並處理請求中，但目前未有回應。
    
    200 	OK
    201	請求成功且新的資源成功被創建，通常用於 POST 或一些 PUT 請求後的回應。
    202	此請求已經被接受但尚未處理。
    
    300	請求擁有一個以上的回應。
    301	請求資源的 URI 已被改變。
    302	此響應代碼表示請求資源的 URI 已臨時更改。
    
    400 	此回應意味伺服器因為收到無效語法，而無法理解請求。
    401	需要授權以回應請求。它有點像 403，但這裡的授權，是有可能辦到的。
    403	用戶端並無訪問權限，例如未被授權，所以伺服器拒絕給予應有的回應。不同於 401，伺服端知道用戶端的身份。
    404	伺服器找不到請求的資源。
    
    500	請求已進入伺服器，						可能原因:程式錯誤-php-error
    501	伺服器不支援請求的方法，僅有GET與HEAD是伺服器必須支援的方法。
    502	作為閘道的伺服器，在獲取處理請求所需的回應時，得到無效回應。
    503	常見原因是服務器因維護而停機或過載。
    504	伺服器作為閘道器時無法及時得到回應。				可能原因:cloudfront節點未更新
    505	請求使用的 HTTP 版本不被伺服器支援。



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
