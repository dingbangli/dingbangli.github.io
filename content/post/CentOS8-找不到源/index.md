+++
author = "Hugo Authors"
title = "CentOS8-找不到源"
date = "2022-08-19"
#description = ""
categories = [
    "Linux"
]
tags = [
    "CentOS",
]
image = "100.png"
+++

    dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
    dnf distro-sync

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
