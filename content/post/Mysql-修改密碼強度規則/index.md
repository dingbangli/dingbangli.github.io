+++
author = "Hugo Authors"
title = "Mysql-修改密碼強度規則"
date = "2022-09-27"
description = "ERROR 1819 (HY000): Your password does not satisfy the current policy requirements"
categories = [
    "Database"
]
tags = [
    "MySQL",
]
image = "100.png"
+++

# ERROR 1819 (HY000): Your password does not satisfy the current policy requirements

查看密碼強度規則

    show variables like 'validate_pass%';
    
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

 修改密碼強度為最低
 
    set global validate_password_policy=0;
 
 修改密碼長度為4 (最短)
 
    set global validate_password_length=4;
 
 修改密碼 特殊符號為最低
 
    set global validate_password_special_char_count =0; 
    
再次查看規則

    show variables like 'validate_pass%';
    
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
  
修改 root 密碼

    SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123456');


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
