+++
author = "Hugo Authors"
title = "AWS-下載 aws-cli && aws configure 設定"
date = "2022-08-05"
#description = ""
categories = [
    "AWS"
]
tags = [
    "AWS",
]
image = "100.png"
+++


# AWS CLI 安裝及更新 

[ 官網: https://docs.aws.amazon.com/zh_tw/cli/latest/userguide/getting-started-install.html ]

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

    unzip awscliv2.zip

    sudo ./aws/install

    aws --version

# AWS CONFIGURE 設定檔設定

`需要先建立 IAM USER 並 create access key`

設定步驟: (IAM download accesskey.csv)

    AWS Access Key ID [None]: XXXXXXXXXXXXXXXXXXX
    
    AWS Secret Access Key [None]: XXXXXXXXXXXXXXXXXXX
    
    Default region name [None]: ap-northeast-1
    
    Default output format [None]: 

設定檔路徑:

```yaml
cat ~/.aws/credentials

```

    [default]
    
    aws_access_key_id=XXXXXXXXXXXXXXXXXXXXXXXXXXX
    
    aws_secret_access_key=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

```yaml
cat ~/.aws/config

```

    [default]
    
    region=us-west-2
    
    output=json

AWS 憑證原理:

    當您使用指定 AWS Identity and Access Management (IAM) 角色的共用設定檔時，
    
    AWS CLI 會呼叫 AWS STS AssumeRole 操作來擷取臨時憑證。然後會存放這些憑證 (在 ~/.aws/cli/cache 中)。
    
    後續的 AWS CLI 命令會使用快取的臨時憑證，直到過期為止，此時 AWS CLI 會自動重新整理憑證
    
    
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
