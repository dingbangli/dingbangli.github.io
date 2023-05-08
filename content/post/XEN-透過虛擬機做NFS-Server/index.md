+++
author = "Hugo Authors"
title = "XenServer-透過虛擬機做NFS-Server "
date = "2022-08-12"
description = "(dev/mapper/centos-root)"
categories = [
    "Linux"
]
tags = [
    "XenCenter",
]
image = "100.png"
+++

    yum -y install nfs-utils nfs-utils-lib
    mkdir -p /data2/nfs
    chmod 777 /data2/nfs

    允許172.16.0.0/16網段的機器掛載  /data2/nfs
    echo ‘data2/nfs 172.16.0.0/24(rw,sync,no_root_squash,no_all_squash)’ >> /etc/exports
    service nfs start

    使用XenServer–170 匯出174的xva映像檔
    mkdir -p /data2/export
    mount -t nfs 172.16.0.222:/data2/nfs /data2/export
    xe vm-list name-label=174	(查看174的uuid)
    xe vm-export filename=/data2/export/174.xva vm=8fa16dde-c06d-726c-56da-c0fe47cf3d06	(使用174的uuid 製作映像檔)

    XenServer – 180 匯入174的xva映像檔
    mkdir -p /data2/export
    mount -t nfs 172.16.0.222:/data2/nfs /data2/export
    xe vm-import filename=/data2/export/174.xva
    
    匯入完成之後在XenServer – 180底下會自動生成184

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
