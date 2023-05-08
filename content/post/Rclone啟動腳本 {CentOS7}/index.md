+++
author = "Hugo Authors"
title = "Rclone啟動腳本 {CentOS7}"
date = "2023-02-01"
#description = ""
categories = [
    "rclone"
]
tags = [
    "rclone",
]
image = "100.png"
+++

[官方 Global Flags] https://rclone.org/flags/?utm_source=ld246.com

[參考文獻] https://ld246.com/article/1600853705300

```yaml
cat <<EOF |tee /usr/lib/systemd/system/rclone.service
# User service for Rclone mounting
#
# Place in ~/.config/systemd/user/
# File must include the '@' (ex rclone@.service)
# As your normal user, run 
#   systemctl --user daemon-reload
# You can now start/enable each remote by using rclone@<remote>
#   systemctl --user enable rclone@drive
#   systemctl --user start rclone@drive
#   Global Flags https://rclone.org/flags/?utm_source=ld246.com

[Unit]
Description=rclone: Remote FUSE filesystem for cloud storage config
Documentation=man:rclone(1)
After=network-online.target
Wants=network-online.target
AssertPathIsDirectory=/home/web-note

[Service]
Type=notify
ExecStartPre=/bin/mkdir -p /home/web-note
ExecStart= \
  /usr/bin/rclone mount -P \
    --config /root/.config/rclone/rclone.conf \
    --allow-non-empty \
    --allow-other \
    --vfs-cache-mode full \
    --vfs-cache-max-size 500M \
    --dir-cache-time 5m \
    --poll-interval 1m \
    --vfs-read-chunk-size-limit 128M \
    --vfs-read-chunk-size-limit off \
    --log-level INFO \
    --log-file /var/log/rclone/rclone.log \
    --bwlimit 0 \
    --umask 022 \
    hward: /home/web-note

ExecStop=/bin/fusermount -uz /home/web-note
Restart=always
RestartSec=10

[Install]
WantedBy=default.target


EOF

```

設置開機啟動

    systemctl enable rclone

   ***常用參數***
   
|  Rclone 常用參數	                                        | 功能								                                                                                            |
|  ----------------------------------------------------- 	| ---------------------------------------------------------------------------------------------------------------               |
|  Type=notify  								        	| 掛載點被成功配置之後 service 會進行啟動狀態						                                                            |
|  -P                       								| 顯示實時速度                                                                                                    			   	|
|  --allow-non-empty 									    | 允許掛載到非空目錄（Not Windows）		                                                                                        |
|  --allow-other									        | 允許其他用戶訪問				                                    	                                                        |
|  --vfs-cache-mode full								    | 緩存模式 off|minimal|writes|full (default off)						                                                        |
|  --vfs-cache-max-size 500M 						    	| 緩存中對象的最大總大小（默認關閉）		                                                                                    |
|  --dir-cache-time 5m   							    	| 緩存時間							                            	                                                            |
|  --poll-interval 1m 				                        | 在輪詢更改之間等待的時間。 必須小於 dir-cache-time	                                                                        |
|  --vfs-read-chunk-size-limit off                          | 最大緩存大小 (默認是 "off")                                                                                                   |
|  --log-level INFO 									    | 允許掛載到非空目錄（Not Windows）		                                                                                        |
|  --log-format LIST									    | 可配置 date, time, microseconds, longfile, shortfile, UTC. 默認是 “date,time”				                                |
|  --log-file /var/log/rclone/rclone.log					| 緩存模式 off|minimal|writes|full (default off)						                                                        |
|  --bwlimit 40M 						    	            | 限制速度40MB		                                                                                                            |
|  --umask 022   							    	        | 每一個新產生的檔案會是644 (rw-r--r--)							                            	                                |
|  Restart=always 				                            | 自動啟動	                                                                                                                    |


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
