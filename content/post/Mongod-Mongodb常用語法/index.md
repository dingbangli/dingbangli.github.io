+++
author = "Hugo Authors"
title = "Mongodb-常用語法"
date = "2022-08-15"
#description = ""
categories = [
    "Database"
]
tags = [
    "Mongodb",
]
image = "100.png"
+++

    
創建資料庫  (如果資料庫不存在，則創建並切換過去)
    
    use DATABASE_NAME
    
創建集合
    
    db.createCollection("runoob")

查看集合

    show collections && show tables
    
查看資料庫

    db.col.find()
    
顯示目前數據庫

    db
    
查看所有數據庫

    show dbs

插入資料到數據庫

    db.test222.insert({"name":"菜鳥"})

刪除數據庫

    db.dropDatabase()

删除集合

    db.collection.drop()

創建固定集合mycol，集合空間大小6142800B，文檔最大個數10000個

    db.createCollection("mycol", { capped : true, autoIndexId : true, size : 6142800, max : 10000 } )

集合插入多個文檔

    db.col.insert({title: 'MongoDB教程', 
        description: 'MongoDB 是一個Nosql數據庫',
        by: '菜鳥',
        url: 'https://note.laurance.ml',
        tags: ['mongodb', 'database', 'NoSQL'],
        likes: 100
        })

或是可以設成變量

    document=({title: 'MongoDB教程', 
        description: 'MongoDB 是一個Nosql數據庫',
        by: '菜鳥',
        url: 'https://note.laurance.ml',
        tags: ['mongodb', 'database', 'NoSQL'],
        likes: 100
        });
在執行插入動作
    
    db.col.insert(document)

        
        


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
