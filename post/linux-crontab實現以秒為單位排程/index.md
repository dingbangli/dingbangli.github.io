# Linux - Crontab 實現以秒為單位排程


***
***

# 方法一	(設置crontab)

***
***

{{< admonition example >}}
    
EX:	(每10秒執行一次)
 * * * * * php /root/test/php/crontab/tolog.php
 * * * * * sleep 10; php /root/test/php/crontab/tolog.php
 * * * * * sleep 20; php /root/test/php/crontab/tolog.php
 * * * * * sleep 30; php /root/test/php/crontab/tolog.php
 * * * * * sleep 40; php /root/test/php/crontab/tolog.php
 * * * * * sleep 50; php /root/test/php/crontab/tolog.php
 
{{< /admonition >}}

***
***
    
# 方法二   設置腳本 shell-script

***
***
    
`EX:最多每2秒執行`
    
 ```sql
 #/bin/bash
    
step=2 #間隔的秒數
for (( i=0; i < 60; i=(i+step) )); do
    
XXX 動作 XXX
    
sleep $step
done
    
exit 0
```

***
***

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
> URL: https://laurance.eu.org/posts/linux-crontab%E5%AF%A6%E7%8F%BE%E4%BB%A5%E7%A7%92%E7%82%BA%E5%96%AE%E4%BD%8D%E6%8E%92%E7%A8%8B/  

