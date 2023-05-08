+++
author = "Hugo Authors"
title = "Linux-安裝telegraf-agent實現監控"
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
    yum -y install telnet
    
    
    修改設定
    vim /etc/telegraf/telegraf.conf
    
    [[outputs.influxdb]]
      urls = ["http://172.15.1.251:8086"]
      database = "telegraf"
      username = "telegraf"
      password = "metrics"
    [[inputs.net]]
    [[inputs.netstat]]
    
    
    確認telegraf-server 的 8086 port有通
    telnet 172.15.1.251 8086 
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
