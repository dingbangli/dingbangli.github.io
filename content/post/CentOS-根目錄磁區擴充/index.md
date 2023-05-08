+++
author = "Hugo Authors"
title = "CentOS-根目錄磁區擴充"
date = "2022-08-03"
description = "(將home磁區分割為50G並將其餘空間擴充到根目錄底下)"
categories = [
    "Linux"
]
tags = [
    "CentOS",
]
image = "100.png"
+++

    安裝xfsdump工具
    yum install xfsdump -y

    備份/home磁區的掛載內容 (一路按ENTER)
    xfsdump -f /home.xfsdump /home
   ![](0001.png)
   
    這時候會再跟目錄出現剛剛備份的 /home >> home.xfsdump
   ![](0002.png)
   
    成功備份後，將/home磁區移除掛載 (必須以root身分登入才能執行)
    umount /home
   ![](0003.png)

    將/home磁區大小定義為50G
    lvreduce -L 50G /dev/mapper/centos-home
   ![](0004.png)

    將其餘空間擴充到根目錄底下
    lvextend -l +100%FREE /dev/mapper/centos-root
   ![](0005.png)

    使根目錄擴充生效
    xfs_growfs /dev/mapper/centos-root
   ![](0006.png)

    格式化/home掛載對應的磁區
    mkfs.xfs -f /dev/mapper/centos-home
   ![](0007.png)

    重新掛載/home
    mount /home
   ![](0008.png)

    將原本備份的內容寫入/home
    xfsrestore -f /home.xfsdump /home
   ![](0009.png)
   
    可以看倒已將磁區容量擴充
   ![](00010.png)


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
