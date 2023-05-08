+++
author = "Hugo Authors"
title = "Docker-Install docker-compose"
date = "2022-10-06"
#description = ""
categories = [
    "Docker"
]
tags = [
    "Docker",
]
image = "100.png"
+++

**下載安裝包**

    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    
**對二進製文件應用可執行權限**

    sudo chmod +x /usr/local/bin/docker-compose
    
**創建指向 /usr/bin 或路徑中任何其他目錄的符號鏈接**

    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    
**測試 docker-compose**

    docker-compose --version

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
