+++
author = "Hugo Authors"
title = "AWS-Codecommit SSH 金鑰上傳及設置"
date = "2022-09-30"
#description = ""
categories = [
    "AWS"
]
tags = [
    "AWS",
]
image = "100.png"
+++

    先到個人帳號家目錄下的.ssh 製作金鑰
   ![](001.png)
   
    製作完後會有兩支檔案
   ![](003.png)
   
    製作完後將id_rsa.pub 上傳至AWS-IAM個人帳號
   ![](004.png)
   
    上傳後會得到SSH密鑰 ID
    
    將ID複製下來
   ![](005.png)
   
    再回到機器帳號跟目錄下的.ssh
    
    vim config
    Host git-codecommit.ap-northeast-2.amazonaws.com < --只需要地區，目錄不用
    User SSH密鑰 ID
    IdentityFile ~/.ssh/id_rsa <--私鑰檔案路徑
   ![](007.png)

    Codecommit的位置取得
   ![](006.png)
   
    新增完成後將檔案權限改為 600
    chmod 600 config
   ![](008.png)
    
    即完成設定

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
