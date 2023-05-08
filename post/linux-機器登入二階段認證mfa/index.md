# Linux - 建立 MFA 二階段認證


***
***

## 手機先下載 APP
    
### app store 搜索 : Twilio Authy

### googleplay store  搜索 : Twilio Authy 2-Factor Authentication

***
***

## 輸入使用要設定的帳號輸入

### 切換成使用者 laurance
    
```sql
su - nadal
```

### 執行語法 `google-authenticator`
    
### 按 `y` 按到結束 > 帳號家目錄下面會有一支 `.google_authenticator`

```sql
google-authenticator

>> y

>> y

>> y

. . . . . 
```

### 建立該帳號存 `MFA驗證` 的目錄

```sql
mkdir /home/gauth/laurance/
```
    
### 將 `.google_authenticator` 移動到 `/home/gauth/laurance/` 下面

```sql
mv  /home/laurance/.google_authenticator /home/gauth/laurance/
``` 

### 權限改給 `root`

```sql
chown root.root /home/gauth/laurance/.google_authenticator
```

***
***

## 將上面顯示的網址 輸入到瀏覽器即可得到一張 `QR Code`

***

### 使用 `APP` 掃瞄那張 `QR Code` 即可成功加入設定

***
***
    
## 使用 `XShell` 登入時

***
    
### 選擇下面的 keyboard Interactive 登入

***
    
### 第一次輸入密碼 第二次輸入 APP顯示的六位數字 即可登入
    
***
***        

{{< admonition example >}}
 
#### 機器服務安裝教學參考:

https://shenyu.me/2016/09/05/centos-google-authenticator.html

{{< /admonition >}}

***
***
    
## 機器服務安裝步驟

***
***
    
### 安裝依賴套件
    
```sql
yum -y install gcc make pam-devel libpng-devel libtool wget git
```
    
### 直接安裝 `EPEL 源 RPM 包`

***

 #### CentOS 6
```sql
rpm -Uvh http://mirrors.ustc.edu.cn/fedora/epel/epel-release-latest-6.noarch.rpm
```
    
 #### CentOS 7
    
```sql
rpm -Uvh http://mirrors.ustc.edu.cn/fedora/epel/epel-release-latest-7.noarch.rpm
```
    
### 安裝Qrencode，谷歌身份驗證器需要調用該程序生成二維碼並顯示
    
```sql
yum install -y qrencode
```    
    
### 安裝谷歌身份驗證器
    
```sql
git clone https://github.com/google/google-authenticator-libpam.git
    
cd google-authenticator-libpam/
```    
    
### 編譯並安裝
    
```sql
./bootstrap.sh
  
./configure --prefix=/usr/local/google-authenticator
    
make && make install
```    
    
### 複製 google 身份驗證器 pam 模塊到系統下
    
```sql
cp /usr/local/google-authenticator/lib/security/pam_google_authenticator.so /lib64/security/
```
    
### 建立指令連結到環境變數
    
```sql
ln -s /usr/local/google-authenticator/bin/google-authenticator  /usr/bin/
```    
    
### 配置 `/etc/pam.d/sshd`

### 在 auth       substack     password-auth 下面
    
### 新增

```sql    
auth       required     pam_google_authenticator.so user=root secret=/home/gauth/${USER}/.google_authenticator  nullok
```
    
### 配置 `SSH服務`
    
```sql
vim /etc/ssh/sshd_config
```    
    
### 修改以下參數
    
```sql
ChallengeResponseAuthentication yes
    
PasswordAuthentication no
  
PubkeyAuthentication yes

UsePAM yes
```
    
### 重啟 `ssh服務`
    
```sql
service sshd restart
```




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


---

> Author: Laurance  
> URL: https://laurance.eu.org/posts/linux-%E6%A9%9F%E5%99%A8%E7%99%BB%E5%85%A5%E4%BA%8C%E9%9A%8E%E6%AE%B5%E8%AA%8D%E8%AD%89mfa/  

