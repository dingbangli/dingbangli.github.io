+++
author = "Hugo Authors"
title = "Grafana + influxdb + telegraf , 構建Linux效能監控"
date = "2022-09-27"
#description = ""
categories = [
    "Grafana",
    "influxdb",
    "telegraf"
]
tags = [
    "Grafana",
    "influxdb",
    "telegraf"
]
image = "100.png"
+++

   [Grafana 官方載點](https://grafana.com/grafana/download)
   
   以下用YUM方式安裝 Grafanae-8.2.3-1
    
    wget https://dl.grafana.com/enterprise/release/grafana-enterprise-8.2.3-1.x86_64.rpm
    
    yum localinstall grafana-enterprise-8.2.3-1.x86_64.rpm
    
    #啟動服務
    systemctl start grafana-server
    
    #檢視服務狀態
    systemctl status grafana-server
    
   [InfluxDB 官方載點](https://portal.influxdata.com/downloads/)
   
   以下用YUM方式安裝 InfluxDB v1.8.0

    # influxdb.key GPG Fingerprint: 05CE15085FC09D18E99EFB22684A14CF2582E0C5
    cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
    [influxdb]
    name = InfluxDB Repository - RHEL \$releasever
    baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
    enabled = 1
    gpgcheck = 1
    gpgkey = https://repos.influxdata.com/influxdb.key
    EOF
       
    sudo yum install influxdb
    
   [Telegraf 官方載點](https://portal.influxdata.com/downloads/)
   
   以下用YUM方式安裝 Telegraf v1.24.1
   
    # influxdb.key GPG Fingerprint: 05CE15085FC09D18E99EFB22684A14CF2582E0C5
    cat <<EOF | tee /etc/yum.repos.d/influxdata.repo
    [influxdata]
    name = InfluxData Repository - Stable
    baseurl = https://repos.influxdata.com/stable/\$basearch/main
    enabled = 1
    gpgcheck = 1
    gpgkey = https://repos.influxdata.com/influxdata-archive_compat.key
    EOF
    
    sudo yum install telegraf
    
   Step.1 修改Telegraf的設定檔並啟動:   
   
   (將output-influxdb打開並指向database-telegraf,及打開network參數,及新增使用者)
   
   ![](0001.png)
   
   ![](0002.png)
    
    service telegraf start
    
   Step.2 啟動influxdb,並查看資料有沒有正確寫進去DB
   
    service influxdb start
  ![](0003.png)
  
   Step.3 建立telegraf使用者,並給予權限
   
    create user telegraf with password 'telegraf'
    
    grant all on telegraf to telegraf

   Step.4 啟動grafana
   
    systemctl start grafana-server
    
   Step.5 開啟後台 http://localhost:3000 並建立datasource
  
  ![](0004.png)

  ![](0005.png)
  
  ![](0006.png)
  
  ![](0007.png)
  
  Step.6 匯入Grafana官方模板
  
  ![](0008.png)
  
  ![](0009.png)
  
  ![](0010.png)
  
  Step.7 驗證: 打開本機3000port
  
  ![](0011.png)
    
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
