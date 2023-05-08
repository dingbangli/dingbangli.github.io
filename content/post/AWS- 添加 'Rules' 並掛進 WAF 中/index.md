+++
author = "Hugo Authors"
title = "AWS - WAF & Rules 建置"
date = "2022-09-08"
description = "( 封鎖 IP 政策 )"
categories = [
    "AWS"
]
tags = [
    "AWS",
]
image = "100.png"
+++

{Step 1} 建立 `IP match conditions`

 ![](401.png)
 
{Step 2} 輸入名稱 , 區域 , 要封鎖的 IP

 ![](402.png)
 ![](403.png) 
 
{Step 3} 建立 `Rules` 

 ![](404.png)
 
{Step 4} 輸入名稱 , 規則 , 掛進剛建立的 `IP match conditions`

 ![](405.png)
 
{Step 5} 編輯 `Web ACL`  將剛建立的 `Rules` 掛入

 ![](406.png)
 ![](407.png)

---

# Web ACL 建置

點選 `Create web ACL` 區域選 `Global CloudFront`

 ![](301.png)
 
輸入名稱 , Cloudwatch metric 名稱 (這兩個名稱之後無法更改)

 ![](302.png)
 
選擇該 WAF 政策

 ![](303.png)
 
選擇該 WAF 規則

 ![](304.png)
 ![](305.png)
 
建立

 ![](306.png)



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
