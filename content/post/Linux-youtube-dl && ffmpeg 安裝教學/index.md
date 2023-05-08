+++
author = "Hugo Authors"
title = "Linux-youtube-dl && ffmpeg 安裝教學"
date = "2023-02-13"
#description = ""
categories = [
    "Linux"
]
tags = [
    "youtube-dl",
]
image = "100.png"
+++


# {youtube-dl官方} https://youtube-dl.org

# {ffmpeg官方} https://ffmpeg.org/download.html

# youtube-dl

安裝最新穩定版本

    curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/bin/youtube-dl
    
給予權限

    chmod a+rx /usr/bin/youtube-dl
    
查看版本

    youtube-dl --version
    
更新版本

    youtube-dl --update    
    
# ffmpeg

安裝依賴

    yum install yasm
    
官方載 tar包

    wget https://ffmpeg.org/releases/ffmpeg-5.1.2.tar.gz
    
解壓 && 安裝

    tar zxvf ffmpeg-5.1.2.tar.gz
    
    ./configure --prefix=/usr/local/ffmpeg --enable-openssl
    
    make && make install

建立 Link

    ln -s /usr/local/ffmpeg/bin/ffmpeg /usr/bin/ffmpeg
    
查看版本

    ffmpeg -version
    
參考: https://guopengzhen.com/%E7%BF%BB%E8%AF%91/205/


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
