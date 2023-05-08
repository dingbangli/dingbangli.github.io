+++
author = "Hugo Authors"
title = "shell script-偵測telegraf服務"
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
step=2 #間隔的秒數
TOKEN="XXX"
message="%0D%0A TEST-222 Telegraf offline"
l_process=`ps aux |grep telegraf |grep -v 'grep'|awk '{print $2}'`

curl -i -XPOST 'http://localhost:8086/query?db=telegraf'   --data-urlencode "q=drop series  FROM "live"  where "host"='222' "

for (( i=0; i < 60; i=(i+step) )); do

        if [ ! -n "$l_process" ]; then
            curl -i -XPOST 'http://localhost:8086/write?db=telegraf'   --data-binary 'live,host=222 value=0'
            curl https://notify-api.line.me/api/notify -H "Authorization: Bearer ${TOKEN}" -d "message=${message}"

        else
            curl -i -XPOST 'http://localhost:8086/write?db=telegraf'   --data-binary 'live,host=222 value=1'

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
