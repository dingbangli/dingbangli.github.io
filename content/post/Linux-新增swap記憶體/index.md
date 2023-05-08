+++
author = "Hugo Authors"
title = "Linux-新增SWAP記憶體"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Linux",
]
image = "100.png"
+++



    解決RAM不足問題 - 在 LINUX 新增 SWAP 虛擬記憶體
    
    以一台 1Gb 記憶體的主機而言，我們在這裡建立 2G的 Swap 虛擬記憶體儲存空間
    
    cd /
    fallocate -l 2G swapfile
    chmod 600 swap-sda1
    
    初始化 Swap 空間
    
    透過 mkswap 將 /swapfile 建立為 Linux 交換區，讓這個資料夾被分割為一個磁碟區
    
    mkswap /swapfile
    
    啟動交換區
    
    swapon /swapfile
    
    開機啟動
    
    swapon -s
    
    如果不使用，可透過以下指令終止：
    
    sudo swapoff /swapfile
    
    如果想先主要以實體記憶體為主，swap 為輔，可以透過 swappiness 來設定分配方式
    
    sysctl vm.swappiness=10 >> 預設通常會是 60 （值越高，表示會越優先使用 swap，範圍 0~100）
    
    開機自動設定
    
    echo "vm.swappiness=10" >> /etc/sysctl.conf"



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
