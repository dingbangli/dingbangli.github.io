# MySQL - 報錯 Your password does not satisfy the current policy requirements ( error 1819 HY000) 解決方法


<!--more-->
當建立 MySQL 帳號或者修改密碼時, 密碼強度不符合要求, 會出現以下錯誤

`ERROR 1819 (HY000): Your password does not satisfy the current policy requirements.`

***
***

**查看密碼強度規則**
-----

```sql
show variables like 'validate_pass%';
```
    
   ```sql
    +--------------------------------------+--------+
    | Variable_name                        | Value  |
    +--------------------------------------+--------+
    | validate_password_check_user_name    | OFF    |
    | validate_password_dictionary_file    |        |
    | validate_password_length             | 8      |
    | validate_password_mixed_case_count   | 1      |
    | validate_password_number_count       | 1      |
    | validate_password_policy             | MEDIUM |
    | validate_password_special_char_count | 1      |
    +--------------------------------------+--------+
  ```

***
***

**修改密碼強度為最低**
-----
 
```sql
set global validate_password_policy=0;
```
 
***
***

**修改密碼長度為4 (最短)**
----
 
```sql
set global validate_password_length=4;
```

***
***
 
**修改密碼 特殊符號為最低**
-----
 
```sql
set global validate_password_special_char_count =0; 
```

***
***
    
**再次查看規則**
-----

```sql
show variables like 'validate_pass%';
```
    
   ```sql
    +--------------------------------------+-------+
    | Variable_name                        | Value |
    +--------------------------------------+-------+
    | validate_password_check_user_name    | OFF   |
    | validate_password_dictionary_file    |       |
    | validate_password_length             | 4     |
    | validate_password_mixed_case_count   | 1     |
    | validate_password_number_count       | 1     |
    | validate_password_policy             | LOW   |
    | validate_password_special_char_count | 0     |
    +--------------------------------------+-------+
   ```
 
 ***
 ***

**修改 root 密碼**
-----

```sql
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123456');
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
> URL: https://laurance.eu.org/posts/mysql-%E4%BF%AE%E6%94%B9%E5%AF%86%E7%A2%BC%E5%BC%B7%E5%BA%A6%E8%A6%8F%E5%89%87/  

