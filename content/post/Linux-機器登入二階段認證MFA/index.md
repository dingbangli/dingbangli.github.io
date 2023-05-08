+++
author = "Hugo Authors"
title = "Linux-機器登入二階段認證MFA"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "MFA",
]
image = "100.png"
+++



    手機先下載APP
    
    app store: Twilio Authy
    googleplay store: Twilio Authy 2-Factor Authentication
    ------------------------------------------------------------ 
    輸入使用要設定的帳號輸入
    su - nadal
    $ google-authenticator > 按y按到結束 >帳號家目錄下面會有一支 .google_authenticator
    #mkdir /home/gauth/username/
    將 .google_authenticator 移動到/home/gauth/username/ 下面
    #mv  /home/username/.google_authenticator /home/gauth/username/
    權限改給root 
    #chown root.root /home/gauth/username/.google_authenticator
    
    再將上面顯示的網址
    輸入到瀏覽器即可得到一張QR Code
    再使用APP掃瞄那張QR Code即可成功加入設定
    ------------------------------------------------------------
    使用XShell登入時
    選擇下面的 keyboard Interactive 登入
    第一次輸入密碼 第二次輸入 APP顯示的六位數字 即可登入
    
    
    機器服務安裝教學:
    https://shenyu.me/2016/09/05/centos-google-authenticator.html
    ---------------------------------------------------------------------------------------------------
    機器服務安裝步驟
    安裝依賴套件
    yum -y install gcc make pam-devel libpng-devel libtool wget git
    
    直接安裝EPEL源RPM包
    #CentOS 6
    rpm -Uvh http://mirrors.ustc.edu.cn/fedora/epel/epel-release-latest-6.noarch.rpm
    # CentOS 7
    rpm -Uvh http://mirrors.ustc.edu.cn/fedora/epel/epel-release-latest-7.noarch.rpm
    
    安裝Qrencode，谷歌身份驗證器需要調用該程序生成二維碼並顯示
    yum install -y qrencode
    
    安裝谷歌身份驗證器
    git clone https://github.com/google/google-authenticator-libpam.git
    cd google-authenticator-libpam/
    
    編譯並安裝
    ./bootstrap.sh
    ./configure --prefix=/usr/local/google-authenticator
    make && make install
    
    複製google身份驗證器pam模塊到系統下
    cp /usr/local/google-authenticator/lib/security/pam_google_authenticator.so /lib64/security/
    
    建立指令連結到環境變數
    ln -s /usr/local/google-authenticator/bin/google-authenticator  /usr/bin/
    
    配置/etc/pam.d/sshd
    在 auth       substack     password-auth 下面
    新增
    auth       required     pam_google_authenticator.so user=root secret=/home/gauth/${USER}/.google_authenticator  nullok
    
    配置SSH服務
    vim /etc/ssh/sshd_config
    修改以下參數
    ChallengeResponseAuthentication yes
    PasswordAuthentication no
    PubkeyAuthentication yes
    UsePAM yes
    
    重啟ssh服務
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
