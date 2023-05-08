# GIT - 常用語法



## 查看Git版本
    
```sql

git --version

```

## 查看Git設定內容
    
```sql

git config --list

```

## 設定帳戶，讓 Git 知道這台電腦做的修改要連結到哪一個使用者
    
```sql

git config --global user.name "<Your Name>"

```

## 設定電子郵件
    
```sql

git config --global user.email "<your@gmail.com>"

```
    
## 創建一個新的Repository (打開任何一個專案資料夾打上)
    
```sql

git init

```
    
## 顯示目前工作環境狀態
    
```sql

git status

```
    
## 複製專案
    
```sql

git clone XXX

```
    
## 將專案加入追蹤(暫存起來)
    
```sql

git add hello.py

```
    
## 將專案 commit 進去 repository (確定存入版本庫)
    
```sql

git commit -m "Init hello.py"

```
    
## 比較現在檔案和上次 commit 之間的差異
    
```sql

git diff
    
git diff |cat XXX
    
git diff 785641bf91c11f25a01c0d48182e810bc8b3bc1c (git log產生的commit代碼)

```
    
## 詳細列出該次commit的修改內容
    
```sql

git show 

```
    
## 查看目前所有commit的歷史紀錄
    
```sql

git log

```
    
## 檢查更改
    
```sql

git fetch

```
    
## 將這些更改應用到我們的本地倉庫
    
```sql

git merge

```
    
## 檔案尚未加入過追蹤時使用，即可恢復到檔案尚未加入暫存區 (取消add)
    
```sql

git rm --cached hello.py

```
    
## 若檔案已經在 repository 內，則使用以下指令
    
```sql

repository 與 stage 的檔案都會被還原到 HEAD，但 working directory 內的檔案不變
    
git reset HARD

```

## 將本地端程式 push 到遠端檔案庫

```sql

git push -u origin master

```
    
## 切出自己的新分支（使用 -b）
    
```sql

git checkout -b happycoder@feature_branch

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
> URL: https://laurance.eu.org/posts/git-%E5%B8%B8%E7%94%A8%E8%AA%9E%E6%B3%95/  

