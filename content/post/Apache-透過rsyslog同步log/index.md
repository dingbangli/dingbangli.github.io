+++
author = "Hugo Authors"
title = "Apache-透過rsyslog同步log"
date = "2022-08-03"
description = "(Apache透過rsyslog同步LOG到其他台機器)"
categories = [
    "Web"
]
tags = [
    "Apache",
]
image = "100.png"
+++



    編輯 Apache 設定檔
    vim /etc/httpd/conf/httpd.conf

    ErrorLogFormat "[%{u}t] [%-m:%l] [pid %P:tid %T] %7F: %E: [client\ %a] %M% ,\ referer\ %{Referer}i"
    <IfModule logio_module>
    LogFormat "%h %l %u %t \"%r\" %>s %O %I %T %b \"%{Referer}i\" \"%{User-Agent}i\"" nreporter
    </IfModule>
    CustomLog "logs/access-NReporter_log" nreporter

    重啟 Apache 服務和確認 Apache 服務狀態
    systemctl restart httpd && systemctl status httpd

    編輯 rsyslog 設定檔
    vim /etc/rsyslog.conf
    
    ###MODULES###
    $ModLoad imfile # provides support for file logging
    # Send Apache log to N-Reporter
    input(type="imfile" File="/var/log/httpd/access-NReporter_log" Tag="apache" Severity="info" Facility="local6"
    Ruleset="nreporter")
    input(type="imfile" File="/var/log/httpd/error_log" Tag="apache" Severity="warning" Facility="local6"
    Ruleset="nreporter")
    ruleset(name="nreporter"){action(type="omfwd" Target="192.168.2.69" Port="514" Protocol="udp")}

    重啟 Rsyslog 服務和確認 Rsyslog 服務正常
    systemctl restart rsyslog && systemctl status rsyslog



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
