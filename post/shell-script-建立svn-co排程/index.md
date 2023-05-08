# shell-script - 建立 SVN-CO 排程並 sync 至雲端


***
***

```sql

#!/bin/bash

SendLine(){
        LineToken="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        logdate=`date +%Y-%m-%d`
        datee=`date +%Y/%m/%d-%H:%M:%S`
	sourced="source >> Laurance-222"
	purposed="purpose >> hateformis"
	message="SVN-DUMP上傳成功"

	curl https://notify-api.line.me/api/notify -H "Authorization: Bearer ${LineToken}" -d "message=%0D%0A${sourced}%0D%0Ai${purposed}%0D%0A${datee}%0D%0A${message}" -d "stickerPackageId=8525" -d "stickerId=16581290"
}

SDIR=/home/svn/blogtocloud
NOWDATEE=`date +%Y-%m-%d`
NOWTIME=`date +%Y/%m/%d-%H:%M:%S`
PROJECT=nowblog-$NOWDATEE
SDIR2=$SDIR/nowblog-$NOWDATEE
PROJECT2=public-$NOWDATEE
LOGFILE=$SDIR/cloud-svn.log
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

do_rclone()
{
	rclone purge google-drive:$PROJECT
	rclone mkdir google-drive:$PROJECT
	rclone sync $SDIR/$PROJECT google-drive:$PROJECT
	sleep 80

	if [ $? -eq 0 ];then
	    
	    echo " " >> $LOGFILE
	    echo " " >> $LOGFILE
	    echo "###########################" >> $LOGFILE
	    echo "$PROJECT在${NOWTIME}上傳成功" >> $LOGFILE
	else
	    echo " " >> $LOGFILE
            echo " " >> $LOGFILE
            echo "###########################" >> $LOGFILE
	    echo "$PROJECT在${NOWTIME}上傳失敗" >> $LOGFILE
	fi

	rclone purge google-drive:$PROJECT2
	rclone mkdir google-drive:$PROJECT2
	rclone sync $SDIR2/$PROJECT2 google-drive:$PROJECT2
	sleep 80

	if [ $? -eq 0 ];then
            
            echo " " >> $LOGFILE
            echo " " >> $LOGFILE
            echo "###########################" >> $LOGFILE
            echo "$PROJECT2在${NOWTIME}上傳成功" >> $LOGFILE
        else
            echo " " >> $LOGFILE
            echo " " >> $LOGFILE
            echo "###########################" >> $LOGFILE
            echo "$PROJECT2在${NOWTIME}上傳失敗" >> $LOGFILE
        fi

}


do_rclone

sleep 10

SendLine

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
> URL: https://laurance.eu.org/posts/shell-script-%E5%BB%BA%E7%AB%8Bsvn-co%E6%8E%92%E7%A8%8B/  

