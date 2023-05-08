+++
author = "Hugo Authors"
title = "shell-script-偵測 mysql 服務是否正常運作"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "shell script",
]
image = "100.png"
+++


```yaml
#!/bin/bash

step=2 #間隔的秒數

TOKEN="XXX" #LINE TOKEN
MESSAGE1="Mysql Connection Failed!! TCP:3306 offline."
MESSAGE2="Mysql Connection Failed!! TCP:3307 offline."

for (( i=0;i<60;i=(i+step) )); do

        echo "quit" | telnet 127.0.0.1 3306 | grep "Escape character is"
        code1="$?"
        echo "quit" | telnet 127.0.0.1 3307 | grep "Escape character is"
        code2="$?"
                if [ "$code1" -ne 0 ]; then
                        echo "`date +%H:%M:%S` - TCP:3306 offline." >> /root/line/mysql/mysql-error.txt
                        curl -X POST https://notify-api.line.me/api/notify -H "Authorization: Bearer ${TOKEN}" -d "message=${MESSAGE1}"
                        
                elif [ "$code2" -ne 0 ]; then
                        echo "`date +%H:%M:%S` - TCP:3307 offline." >> /root/line/mysql/mysql-error.txt
                        curl -X POST https://notify-api.line.me/api/notify -H "Authorization: Bearer ${TOKEN}" -d "message=${MESSAGE2}"
                fi
                
      sleep $step
    
done
         
exit 0                           

```



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
