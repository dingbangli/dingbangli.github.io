# shell script - 抓 youtube 影片腳本


# 抓影片腳本 (youtube,pornhhub ......)

```sql
#!/bin/bash

#date=`date +%Y%m%d`
binpath="/usr/bin"
savedpath="/home/videorecord"
youtubedl="$binpath/python $savedpath/youtube_dl/__main__.py"

while [ "$anser" != "y" -a "$anser" != "Y" ]
do

	while :
	do

		while :
        do

			while :
			do

				while :
				do

					echo " "    
					read -p "請輸入要下載或裁切影片的日期   ex:20230226: " datee
					echo $datee | egrep -q '^[[:digit:]]{8}$'

					if [ "$?" == "0" ]; then
						break
					else
						echo " "
						echo "日期輸入錯誤 please try again..."
						echo " "
					fi
				done

				if [ ! -f "${datee}NSV.mp4" ]; then
					echo " "
					read -p "請輸入要下載影片的 "m3u8" : " m3u8
					echo " "
					$youtubedl -F $m3u8

					if [ "$?" != "0" ];then
						exit
					fi

					echo " "
					read -p "請輸入要下載影片的 format code : " formatcode
					echo " "
					$youtubedl $m3u8 -f $formatcode -o $savedpath/${datee}NSV.mp4
					code3="$?"
				else
					code3="666"
					echo " "
					echo "${datee}NSV.mp4 已存在 , 準備裁切影片"
				fi
			break
			done

			case $code3 in
				"0")
					break
					;;
				"666")
					break
					;;

			*)
				exit 1
					;;
			esac

			done
		

		echo " "        
        	read -p "請輸入開始裁切時間   ex:00:00:00 : " starting
        	read -p "請輸入結束裁切時間   ex:00:00:00 : " ending
        	echo $starting | egrep -q '^[[:digit:]]{2}\:[[:digit:]]{2}\:[[:digit:]]{2}$'
        	code1="$?"
        	echo $ending | egrep -q '^[[:digit:]]{2}\:[[:digit:]]{2}\:[[:digit:]]{2}$'
        	code2="$?"
#		echo "$code1"
#		echo "$code2"

        	if [ "$code1" -a "$code2" == "0" ]; then
			break
        	else
                	echo " "
                	echo "時間格式輸入錯誤 please try again..."
			continue
        	fi
        done

	echo " "
        echo "==========================================="
        echo "     請確認開始裁切時間為:   $starting"
        echo "     請確認結束裁切時間為:   $ending"
        echo "==========================================="
        echo " "
        read -p "are you sure [y or n] :" anser

done

endd=$(date -d "$ending" +%s)
startt=$(date -d "$starting" +%s)
second=$(($endd-$startt))

if [ "$second" -gt "0" ]; then
	$binpath/ffmpeg -i $savedpath/${datee}NSV.mp4 -ss $starting -t $second -c copy $savedpath/${datee}TBL.mp4

	echo -e " "
	echo "======================================================================"
	echo -e " "
	echo -e "請確認影片是否上傳: "
	echo -e " "
	echo -e "$VIDEOURL/$dateeTBL.mp4"
	echo -e " "
	echo "======================================================================"
	echo -e " "

else
	echo " "
	echo "錄製時間輸入錯誤 please try again..."
	echo " "	
fi
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
> URL: https://laurance.eu.org/posts/shell-script-%E6%8A%93youtube%E5%BD%B1%E7%89%87%E8%85%B3%E6%9C%AC/  

