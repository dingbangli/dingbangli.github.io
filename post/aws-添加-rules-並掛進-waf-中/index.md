# AWS - WAF & Rules 建置


<!--more-->
"建立 AWS-WAF 封鎖 IP 的規則政策"

{{< admonition >}}
# 封鎖規則設置
{{< /admonition >}}

## 建立 `IP match conditions`

---

 ![](401.png)
 
## 輸入名稱 , 區域 , 要封鎖的 IP

---

 ![](402.png)
 ![](403.png) 
 
## 建立 `Rules` 

---

 ![](404.png)
 
## 輸入名稱 , 規則 , 掛進剛建立的 `IP match conditions`

---

 ![](405.png)
 
## 編輯 `Web ACL`  將剛建立的 `Rules` 掛入

---

 ![](406.png)
 ![](407.png)

---

{{< admonition >}}
# Web ACL 建置
{{< /admonition >}}


## 點選 `Create web ACL` 區域選 `Global CloudFront`

 ![](301.png)
 
---

## 輸入名稱 , Cloudwatch metric 名稱 (這兩個名稱之後無法更改)


 ![](302.png)

---

## 選擇該 WAF 政策


 ![](303.png)

---

## 選擇該 WAF 規則

 ![](304.png)
 ![](305.png)

---

## 點選建立

 ![](306.png)

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
> URL: https://laurance.eu.org/posts/aws-%E6%B7%BB%E5%8A%A0-rules-%E4%B8%A6%E6%8E%9B%E9%80%B2-waf-%E4%B8%AD/  

