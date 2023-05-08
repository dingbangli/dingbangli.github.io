#!/bin/bash

TIMEDATE=`date +%Y/%m/%d-%H:%M:%S`
BACKUPDIR=/home/svn/blogtocloud
NOWDATEE=`date +%Y-%m-%d`
PROJECT=nowblog-$NOWDATEE
LOGFILE=$BACKUPDIR/$PROJECT/hugostart.log

echo "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" >> $LOGFILE
echo "" >> $LOGFILE
echo "$TIMEDATE 啟動 hugo 背景模式" >> $LOGFILE 
nohup /usr/bin/hugo -D server --baseUrl="http://172.16.0.222" --bind="0.0.0.0" --port=1313 --logFile="/home/svn/blogtocloud/local-hugo.acc" >> $LOGFILE 2>&1 &
echo "" >> $LOGFILE
echo "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" >> $LOGFILE

### 放到 svn client 推送到每日更新 , 用於背景啟動 hugo
