+++
author = "Hugo Authors"
title = "Mongod- 建立每日備份 Shell Script"
date = "2022-10-22"
#description = ""
categories = [
    "Database"
]
tags = [
    "Mongodb",
]
image = "100.png"
+++

**Linux 建立每日備份 Shell Script**


    #!/bin/sh
 
    # Definded Dump Configuartion
    rollingDays=7
    dumpFilename="mongodb"
    dumpTmpDir="/tmp/mongo-dump-tmp"
    backupPath="/root/mongo-backup"
    username="username"
    password="password"
    hostname="127.0.0.1"
    database="my-mongo"
 
    #Start Dumpping.......
    today=`date "+%Y-%m-%d"`
    echo "Today: ${today}"
    echo "Start Dumpping......."
 
    # Make backup directory
    if ! [ -d "${backupPath}" ] ; then
        echo "make dir : ${backupPath}"
        mkdir -p "${backupPath}"
    fi
    if ! [ -d "${dumpTmpDir}" ] ; then
        echo "make dir : ${dumpTmpDir}"
        mkdir -p "${dumpTmpDir}"
    fi
 
    # Make parameter
    dn="-h ${hostname}"
    if [ "${username}" != "" ] && [ "${password}" != "" ] ; then
        dn="${dn} -u ${username} -p ${password}"
    fi
    if [ "${databse}" != "" ] ; then
        dn="${dn} -d ${database}"
    fi
 
    # Run backup script
    rm -rf -R ${dumpTmpDir}
    command="mongodump ${dn} -o ${dumpTmpDir}"
    echo $command
    $command
    if [ $? == 0 ] ; then
        cd "${dumpTmpDir}"
        /bin/tar -zcvf "${backupPath}/${dumpFilename}-${today}.tar.gz" *
        find ${backupPath}/${dumpFilename}-* -mtime +{rollingDays} -exec rm -f {} \;
    fi
    rm -rf -R ${dumpTmpDir}


[參考文件](https://blog.toright.com/posts/4069/mongodb-%E6%95%99%E5%AD%B8-%E5%A6%82%E4%BD%95%E5%82%99%E4%BB%BD%E8%88%87%E9%82%84%E5%8E%9F-mongodb.html)

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
