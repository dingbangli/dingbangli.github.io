+++
author = "Hugo Authors"
title = "PHP-添加到LINUX系統啟動"
date = "2022-08-03"
#description = ""
categories = [
    "Web"
]
tags = [
    "PHP",
]
image = "100.png"
+++

{{< highlight html >}}

###################################

Centos7 配置php-fpm服务到systemctl

###################################

vim /usr/local/php/etc/php-fpm.conf

###################################

; Pid file
; Note: the default prefix is /usr/local/php/var
; Default Value: none
pid = /var/run/php-fpm.pid

###################################

touch /usr/lib/systemd/system/php-fpm.service

###################################

vim /usr/lib/systemd/system/php-fpm.service

###################################

[Unit]
Description=The PHP FastCGI Process Manager
After=syslog.target network.target

[Service]
Type=forking
PIDFile=/var/run/php-fpm.pid
ExecStart=/usr/local/php/sbin/php-fpm
ExecReload=/bin/kill -USR2 $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target

###################################

systemctl daemon-reload

###################################

ps aux|grep php-fpm

###################################

kill -9 

###################################

systemctl start php-fpm

###################################

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
