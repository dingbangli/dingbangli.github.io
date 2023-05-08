+++
author = "Hugo Authors"
title = "Linux-Crontab實現以秒為單位排程"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Crontab",
]
image = "100.png"
+++



    方法一	(設置crontab)
    
    EX:	(每10秒執行一次)
    #* * * * * php /root/test/php/crontab/tolog.php
    #* * * * * sleep 10; php /root/test/php/crontab/tolog.php
    #* * * * * sleep 20; php /root/test/php/crontab/tolog.php
    #* * * * * sleep 30; php /root/test/php/crontab/tolog.php
    #* * * * * sleep 40; php /root/test/php/crontab/tolog.php
    #* * * * * sleep 50; php /root/test/php/crontab/tolog.php
    
    方法二 	(設置腳本shell)
    
    EX:	(最多每2秒執行)
    
    #/bin/bash
    
    step=2 #間隔的秒數
    for (( i=0; i < 60; i=(i+step) )); do
    
    XXX
    
    sleep $step
    done
    
    exit 0



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
