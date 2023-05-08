+++
author = "Hugo Authors"
title = "CentOS-安装speedtest-cli"
date = "2022-08-03"
description = "(Centos 安装 speedtest-cli網速測試)"
categories = [
    "Linux"
]
tags = [
    "CentOS",
]
image = "100.png"
+++



    wget https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py

    vim speedtest.py >> (第一行#改python3)

    chmod a+rx speedtest.py

    mv speedtest.py /usr/local/bin/speedtest-cli

    chown root:root /usr/local/bin/speedtest-cli

    命令後追加 --share 可以得到測試信息圖片
    speedtest-cli --share

    追加 --list 可以得到所有的測試服務器
    speedtest-cli --list

    使用 – server 測試指定服務器的下載或上傳速度
    speedtest-cli --server 41009 (站点ID可通過 --list 獲取)



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
