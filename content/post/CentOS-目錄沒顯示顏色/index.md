+++
author = "Hugo Authors"
title = "CentOS-目錄沒顯示顏色"
date = "2022-08-03"
#description = "(將home磁區分割為50G並將其餘空間擴充到根目錄底下)"
categories = [
    "Linux"
]
tags = [
    "CentOS",
]
image = "100.png"
+++



    yum install coreutils --allowerasing && or dnf install
    scp DIR_COLORS root@172.17.0.2:~
    mv DIR_COLORS ~/.dir_colors
    reboot


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
