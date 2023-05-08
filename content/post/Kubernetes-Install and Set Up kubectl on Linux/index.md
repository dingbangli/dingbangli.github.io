+++
author = "Hugo Authors"
title = "Kubernetes-Install and Set Up kubectl on Linux"
date = "2022-10-06"
#description = ""
categories = [
    "Kubernetes"
]
tags = [
    "Kubernetes",
]
image = "100.png"
+++

**(1) 在 Linux 上安裝帶有 curl 的 kubectl 二進位檔 (最新)**    
    
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

注意：
要下載特定版本，請將命令部分替換為特定版本。  $(curl -L -s https://dl.k8s.io/release/stable.txt)

例如，要在Linux上下載 v1.25.0 版本，請鍵入：

    curl -LO https://dl.k8s.io/release/v1.25.0/bin/linux/amd64/kubectl
    
**(2) 驗證二進位檔 (選擇)**

下載 kubectl 校驗和檔：

    curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
    
根據校驗和文件驗證 kubectl 二進位檔：

    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
    
如果有效，則輸出為：

    kubectl: OK
    
如果檢查失敗，則以非零狀態退出並列印類似於以下內容的輸出：sha256

    kubectl: FAILED
    sha256sum: WARNING: 1 computed checksum did NOT match
    
**注意：下載相同版本的二進位檔和校驗和。**

**(3) 安裝 kubectl**

    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    
<font color=#FF0000>注意：  
 如果您在目標系統上沒有根訪問許可權，您仍然可以將 kubectl 安裝到該目錄：~/.local/bin</font>	
 
    chmod +x kubectl
    mkdir -p ~/.local/bin
    mv ./kubectl ~/.local/bin/kubectl
    # and then append (or prepend) ~/.local/bin to $PATH
    
**(4) 測試以確保您安裝的版本是最新的：**

    kubectl version --client
    
   或者使用以下內容檢視：
   
    kubectl version --client --output=yaml
    
   

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
