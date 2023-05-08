# AWS - 如何將 AMI 轉出地區 & 帳號


<!--more-->
"紀錄一下如何將 AMI 轉出到其他帳號"

{{< admonition >}}
# 在 ec2 頁面 → 底下 AMI 找到 Actions 點選 copy AMI
{{< /admonition >}}
    
   ![](01.png)

---

{{< admonition >}}   
# 在Destination region 選擇要移轉的地區
{{< /admonition >}}

   ![](02.png)

---

{{< admonition >}}   
# 在 Pemissions 底下按 edit
{{< /admonition >}}
    
   ![](03.png)

   ![](04.png)

---

{{< admonition >}}
# 在AWS Account Number 輸入要移轉的帳號
{{< /admonition >}}

   ![](05.png)

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
> URL: https://laurance.eu.org/posts/aws-ec2-ami%E8%BD%89%E5%9C%B0%E5%8D%80%E5%B8%B3%E8%99%9F/  

