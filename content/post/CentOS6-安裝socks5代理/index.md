+++
author = "Hugo Authors"
title = "CentOS6-安裝socks5代理"
date = "2022-08-03"
description = "(紀錄安裝SS5語法)"
categories = [
    "SOCKET5"
]
tags = [
    "CentOS",
]
image = "100.png"
+++

    wget https://nchc.dl.sourceforge.net/project/ss5/ss5/3.8.9-8/ss5-3.8.9-8.tar.gz
    
    yum -y install gcc automake make
    yum -y install pam-devel openldap-devel cyrus-sasl-devel openssl-devel

    tar xvf ss5-3.8.9-8.tar.gz
    cd ss5-3.8.9
    ./configure && make && make install
    
    vi /etc/opt/ss5/ss5.conf
    auth    0.0.0.0/0               -              -
    permit -        0.0.0.0/0       -       0.0.0.0/0
    
    加入用戶名及密碼 /etc/opt/ss5/ss5.passwd
    
    修改ss5啟動的port(默認是1080)
    vi /etc/sysconfig/ss5
    #SS5_OPTS=” -u root”
    註解新增
    SS5_OPTS=" -u root -b 0.0.0.0:8080"
    
    bash檔增執行權限 /etc/rc.d/init.d/ss5
    chmod 755 /etc/rc.d/init.d/ss5

    service ss5 start

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
