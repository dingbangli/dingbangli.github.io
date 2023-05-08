+++
author = "Hugo Authors"
title = "Linux-Nodejs-安裝"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "NodeJS",
]
image = "100.png"
+++

{{< highlight html >}}

yum install epel-release

yum install nodejs

wget https://nodejs.org/download/release/v8.9.4/node-v8.9.4-linux-x64.tar.gz

tar --strip-components 1 -xzvf node-v* -C /usr/local

node -v

npm -v

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
