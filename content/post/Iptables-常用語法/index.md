+++
author = "Hugo Authors"
title = "Linux-Iptables常用語法"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Iptables",
]
image = "100.jpg"
+++

    
    iptables -A [規則] [-s 要動作的IP] [-d 目的地IP] [-p 協定] [-j 動作]
    
    查看目前設定
    iptables -nL
    
    清除所有規則鏈中的規則
    iptables -F	(不能透過SSH操作,不然會鎖住)
    
    清除使用者自訂鏈中的規則
    iptables -X	(不能透過SSH操作,不然會鎖住)
    
    清除mangle表中，所有規則鏈中的規則
    iptables -F -t mangle	(不能透過SSH操作,不然會鎖住)
    
    
    查看IP鎖了幾個
    iptables -n --list pig|wc -l
    
    查看此IP有沒有被鎖在裡面
    iptables -nL |grep XXX
    
    增加規則except允許此IP 80 port通過
    iptables -A except -p tcp -s XXX/32 --dport 80 -j ACCEPT
    
    刪除規則pig此IP
    iptables -D pig -s XXX -j DROP
    
    查看INPUT裡的規則此IP
    iptables -L INPUT -n --line-numbers |grep "XXX"
    
    以數字的方式顯示pig的總數
    iptables -n --list pig|wc -l
    
    新建機器執行增加火牆規則
    ./root/iptables/ipfish.sh
    
    iptables 刪除某行規則
    增加此行規則
    
    iptables -A INPUT -s 123.123.123.123 -j DROP # 將 123.123.123.123 全部擋掉
    列出所有規則，前面加上行號
    
    iptables -L INPUT -n --line-numbers
    要刪除某一行的規則
    
    iptables -D INPUT 1 # 若只有上述那行，那就是 1
    iptables -D INPUT 3 # 若有多行，只要刪除第三行
    
    保存iptables規則
    iptables-save >rules-0

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
