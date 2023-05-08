+++
author = "Hugo Authors"
title = "Nginx-設定目錄密碼保護"
date = "2022-08-03"
#description = ""
categories = [
    "Web"
]
tags = [
    "Nginx",
]
image = "100.png"
+++

{{< highlight html >}}

首先需要建立一個密碼檔, 裡面包含了使用者名稱, 以及加密了的密碼, 如果系統有安裝 Apache, 可以用以下語法建立密碼檔:
htpasswd -c /path/to/file/.htpasswd username

但如果沒有 htpasswd 指令可以使用, 那便要手動建立密碼檔, 但也是很簡單的。密碼檔的格式如下:
username 是使用者名稱, 可以自行定義, 而 encrypted-password 則是加密的密碼,
username:encrypted-password:comment

建立密碼檔:
vim /home/opencli/.htpasswd

將要設定的使用者名稱及上面的加密密碼複製到檔案, 即以下格式:
username:saoYYKpu2QSsA

現在開啟 Nginx 的設定檔設定, 以下假設檔案在 /etc/nginx/conf.d/default.conf:
vim /etc/nginx/conf.d/default.conf

    假設我要設定密碼保護的目錄是 /usr/share/nginx/html/admin, 在 server 段落加入以下幾行:
    location /admin/ {
        auth_basic "Restricted";
        auth_basic_user_file /home/opencli/.htpasswd;
    }

儲存檔案後需要重新啟動 Nginx:
systemctl restart nginx

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
