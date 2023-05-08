+++
author = "Hugo Authors"
title = "XenServer-擴充root磁區"
date = "2022-08-03"
description = "(dev/mapper/centos-root)"
categories = [
    "Linux"
]
tags = [
    "XenCenter",
]
image = "100.png"
+++

{{< highlight html >}}

XEN-center >> storage >> ADD disk 新增30G

查看各區硬碟
df -h

查看總硬碟有無新增30G
fdisk -l

檢視已經存在的pv（物理卷）
pvdisplay

檢視當前已經存在的vg（邏輯卷組）
vgdisplay

檢視已經存在的lv（邏輯卷）
lvdisplay

把/dev/xvdb加入與/目錄相同的vg（邏輯卷組）
vgextend centos /dev/xvdb

擴容lv（邏輯卷）
lvextend -L +30.0GB -n /dev/mapper/centos-root

使其生效
xfs_growfs /dev/mapper/centos-root 

df -h

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
