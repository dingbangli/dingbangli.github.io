+++
author = "Hugo Authors"
title = "shell script-新增使用者"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "shell script",
]
image = "100.png"
+++



    #!/bin/bash
    
    while [ "i" != "1" ]
    do
    echo -n new user name:
    
    read name
    
    useradd $name
    
    echo "123456" | passwd --stdin $name
    
    echo finish new user name is:$name
    done
    
    
    sed -i "s/GSSAPIAuthentication yes/GSSAPIAuthentication no/g" /etc/ssh/sshd_config
    sed -i "s/#UseDNS yes/UseDNS no/g" /etc/ssh/sshd_config
    service sshd restart



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
