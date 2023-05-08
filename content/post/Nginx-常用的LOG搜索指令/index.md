+++
author = "Hugo Authors"
title = "Nginx-常用的LOG搜索指令"
date = "2022-08-03"
#description = ""
categories = [
    "Web"
]
tags = [
    "Nginx",
]
image = "100.png"
+++

{{< highlight html >}}

###########################################################################

統計IP訪問量

awk '{print $l}' /var/log/nginx-access.log | sort -n | uniq | wc -l

查看某一時間段IP的訪問量

grep "14/Jul/2021:0[2-10]" /var/log/nginx-access.log | awk '{print $l}' | sort | uniq -c | sort -nr | wc -l

查看訪問次數最頻繁的前100個IP

awk '{print $l}' /var/log/nginx-access.log | sort -n | uniq -c | sort -rn | head -n 100

查看訪問次數100以上的IP

awk '{print $l}' /var/log/nginx-access.log |sort -n |uniq -c |awk '{if($l >100) print $0 } ' | sort -rn

查詢某個IP的詳細訪問情況,按訪問頻率排序

grep '172.16.0.6' /var/log/nginx-access.log |awk '{print $7}'|sort |uniq -c |sort -rn |head -n 100

###########################################################################

頁面訪問統計

###########################################################################

查看訪問最頻繁的頁面

awk '{print $7}' /var/log/nginx-access.log | sort | uniq -c | sort -rn | head -n 100

查看訪問最頻繁的頁面(排除PHP頁面)

grep -v ".php" /var/log/nginx-access.log |awk '{print $7}'|sort|uniq -c|sort -rn|head -n 100

查看頁面訪問次數超過100的頁面

cat /var/log/nginx-access.log | cut -d '' -f 7 | sort | uniq -c | awk '(if ($l >100) print $0}' | less

查看最近1000條紀錄,訪問量最高的頁面

tail -1000 /var/log/nginx-access.log | awk '{print $7} ' |sort|uniq -c|sort -nr|less

###########################################################################

每秒請求量統計

awk '{print $4}' /var/log/nginx-access.log |cut -c 14-21|sort|uniq -c|sort -nr|head -n 100

每分鐘請求統計

awk '{print $4}' /var/log/nginx-access.log|cut -c 14-18|sort|uniq -c|sort -nr|head -n 100

每小時請求統計

awk '{print $4}' /var/log/nginx-access.log |cut -c 14-15|sort|uniq -c|sort -nr|head -n 100

###########################################################################

性能分析

###########################################################################

列出傳輸時間超過3秒的頁面,顯示前20條

cat /var/log/nginx-access.log |awk '($NF > 3){print $7}'|sort -n|uniq -c|sort -nr|head -20

列出PHP頁面請求時間超過3秒的頁面,並統計其出現的次數,顯示前100條

cat /var/log/nginx-access.log|awk '($NF > 1 &&  $7~/\.php/){print $7}'|sort -n|uniq -c|sort -nr|head -100

###########################################################################

蜘蛛抓取統計

###########################################################################

統計蜘蛛抓取次數

grep 'Baiduspider' /var/log/nginx-access.log |wc -l

統計蜘蛛抓取404的次數

grep 'Baiduspider' /var/log/nginx-access.log | grep '404' |wc -l

###########################################################################

TCP連接統計

###########################################################################

查看當前TCP連接數

netstat -tan | grep "ESTABLISHED" | grep ":80" | wc -l

用 Tcpdump 嗅探80端口的訪問看誰高

tcpdump -i enp0s3 -tnn dst port 80 -c 1000 | awk -F"." '{print $1"."$2"."$3"."$4}' | sort | uniq -c | sort -nr

###########################################################################

head -5  		# 前五行LOG 數據

sort -k 1nr		# 按照第一個字段 , 數值排序 , 且為逆序

{{< /highlight >}}

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
