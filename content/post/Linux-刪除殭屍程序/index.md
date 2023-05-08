+++
author = "Hugo Authors"
title = "Linux-刪除殭屍程序"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Linux",
]
image = "100.png"
+++



找出殭屍程序

    ps -Al | grep -w Z
    
從找到的程序資訊中，分析出 pid
    
    ps -Al | grep -w Z | awk '{print $4}'
    
將分析出來的 pid 串連成一個陣列
    
    ps -Al | grep -w Z | awk '{print $4}' | xargs
    
將陣列中的每一個 pid 的程序，利用 kill 來終止、刪除它們
    
    ps -Al | grep -w Z | awk '{print $4}' | xargs sudo kill -9
    
若再跑一次 ps -Al | grep -w Z 還是看到有 zombie process
    
先確認父程序資訊
    
    ps -Al | grep -w Z | awk '{print $5}' | xargs ps -lp
    
再確認相依的子程序資訊
    
    ps -Al | grep -w Z | awk '{print $5}' | xargs ps -l --ppid
    
如果其中沒有重要程序或是其他正在執行中程序的話，就可以安心地將父程序給刪除掉
    
    ps -Al | grep -w Z | awk '{print $5}' | xargs sudo kill -9



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
