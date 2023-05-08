+++
author = "Hugo Authors"
title = "Linux-Rsync 基本設定教學"
date = "2023-02-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Rsync",
]
image = "100.png"
+++


# 環境: A >>> B
    A主機( Server端 ) IP :192.168.1.222
    
    B主機( Clinet端 ) IP :192.168.1.122

# B主機( Clinet端 ) 設定

安裝服務

    yim install xinetd rsync
    
修改服務設定 xinetd.conf

    vim /etc/xinetd.d/rsync
    
```http request
service rsync
{
        disable         = no
        socket_type     = stream
        wait            = no
        user            = root
        server          = /usr/bin/rsync
        server_args     = --daemon
        log_on_failure  += USERID
}
```

修改服務設定 rsyncd.conf

    vim /etc/rsyncd.conf
    
```http request
[update]
path =          /
auth users =    update
hosts allow =   XX.XX.XX.XX  //來源IP
uid =           root
gid =           root
secrets file =  /etc/rsync.secrets
read only =     no
```

設定帳號密碼

    vim /etc/rsync.secrets
    
```http request
update:123abc

```

啟動服務

    systemctl start xinetd
    
# A主機 (Server端) 設定

設定密碼即可

    vim rsync.secrets
    
```http request
123abc

```
    
語法:

    rsync -aHSz  --delete --contimeout=5 --password-file=/etc/rsync.secrets /hugoserver update@XX.XX.XX.XX::update



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
