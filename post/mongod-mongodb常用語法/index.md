# MongoDB - 常用語法


***
***
    
**創建資料庫  (如果資料庫不存在，則創建並切換過去)**
-----
    
```sql
use DATABASE_NAME
```

***
***
    
**創建集合**
-----
    
```sql
db.createCollection("runoob")
```

***
***

**查看集合**
-----

```sql
show collections && show tables
```

***
***
    
**查看資料庫**
-----

```sql
db.col.find()
```

***
***
    
**顯示目前數據庫**
-----

```sql
db
```

***
***
    
**查看所有數據庫**
-----

```sql
show dbs
```

***
***

**插入資料到數據庫**
-----

```sql
db.test222.insert({"name":"菜鳥"})
```

***
***

**刪除數據庫**
-----

```sql
db.dropDatabase()
```

***
***

**删除集合**
-----

```sql
db.collection.drop()
```

***
***

**創建固定集合mycol，集合空間大小6142800B，文檔最大個數10000個**
-----

```sql
db.createCollection("mycol", { capped : true, autoIndexId : true, size : 6142800, max : 10000 } )
```

***
***

**集合插入多個文檔**
-----

```sql
db.col.insert({title: 'MongoDB教程', 
        description: 'MongoDB 是一個Nosql數據庫',
        by: '菜鳥',
        url: 'https://note.laurance.ml',
        tags: ['mongodb', 'database', 'NoSQL'],
        likes: 100
        })
```

***
***

**或是可以設成變量**
-----

```sql
document=({title: 'MongoDB教程', 
        description: 'MongoDB 是一個Nosql數據庫',
        by: '菜鳥',
        url: 'https://note.laurance.ml',
        tags: ['mongodb', 'database', 'NoSQL'],
        likes: 100
        });
```

***
***

**在執行插入動作**
-----
    
```sql
db.col.insert(document)
```

***
***

        
        


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
> URL: https://laurance.eu.org/posts/mongod-mongodb%E5%B8%B8%E7%94%A8%E8%AA%9E%E6%B3%95/  

