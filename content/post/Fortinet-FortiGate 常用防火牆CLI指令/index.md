+++
author = "Hugo Authors"
title = "Fortinet-FortiGate 常用防火牆CLI指令"
date = "2022-09-13"
#description = ""
categories = [
    "FortiGate"
]
tags = [
    "FortiGate",
]
image = "100.png"
+++

    查看設定檔
    show full-configuration

    備份設定檔 
    exe backup config/allconfig/ipsuserdefsigfilename xx.x.x(tftp server)
    
    還原設定檔
    # exe restore config/allconfig/ipsuserdefsig/imagefilename x.x.x.x(tftp server)
    
    顯示系統狀態
    # get sys status
    
    顯示系統效能介面
    # get system interface
    #show system interface
    
    顯示系統效能
    # get system performance
    
    顯示各service utilization
    #diag sys top (ctrl-c exit)
    
    格式化硬碟以消除所有記錄
    #exe formatlogdisk
    
    手動同步HA設定
    #exe ha synchronize config
    
    查看HA 狀態
    #diagnose sys ha checksum cluster    
    #show system ha
    #get sys ha status
    
    重新啟動
    # execute reboot
    
    關機
    # execute shutdown
    
    查看 arp table
    # get system arp
    
    清除 arp table cache
    # execute clear system arp table
    
    ping
    #exe ping x.x.X.X


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
