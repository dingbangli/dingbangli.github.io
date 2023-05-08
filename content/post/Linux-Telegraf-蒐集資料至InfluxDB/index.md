+++
author = "Hugo Authors"
title = "Linux-Telegraf-蒐集資料至InfluxDB"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Telegraf",
]
image = "100.png"
+++


    新增yum源
    
    tee  /etc/yum.repos.d/influxdb.repo <<-'EOF'
    [influxdb]
    name = InfluxDB Repository - RHEL \$releasever
    baseurl = https://repos.influxdata.com/rhel/6Server/x86_64/stable
    enabled = 1
    gpgcheck = 1
    gpgkey = https://repos.influxdata.com/influxdb.key
    EOF
    
    
    安裝telegraf服務
    yum -y install telegraf
    
    安裝telnet測試連線
    yum -y install telnet
    
    修改設定
    vim /etc/telegraf/telegraf.conf
    
    [[outputs.influxdb]]
      urls = ["http://XXX.XXX.XXX.XXX:8086"]
      database = "XXX"
      username = "XXX"
      password = "XXX"
      
      增加監控模組
    [[inputs.net]]
    [[inputs.netstat]]
    
    確認telegraf-server 的 8086 port有通
    telnet XXX.XXX.XXX.XXX 8086 
    -----------------------------------------------------------------------
    啟動 telegraf
    service telegraf start
    --------------------------



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
