# Linux - 將 Python2.7 升級成 Python3.6 語法紀錄


***
***

 ```sql
 
yum -y update

yum -y install vim wget

yum -y install python-setuptools

yum -y install make gcc gcc-c++

yum -y install zlib-devel

yum -y install readline*

yum -y install openssl-devel

yum -y install tk-devel

yum -y install sqlite-devel

```

***
***

```sql

wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz

tar -zxvf Python-3.6.3.tgz

cd Python-3.6.3

./configure --enable-loadable-sqlite-extensions

make

make install

```

***
***

```sql

mv /usr/bin/python /usr/bin/python.bak

ln -s /usr/local/bin/python3 /usr/bin/python

```

***
***
    
## **將每個文件的第一句話 #!/usr/bin/python 改為 #!/usr/bin/python2.7，保存退出即可**

```sql
vim /usr/bin/yum

vim /usr/libexec/urlgrabber-ext-down

vim /usr/bin/firewall-cmd

vim /usr/sbin/firewalld
```

***
***
​    
```sql
service firewalld restart

service firewalld status
    
pip install [packages]
    
ex: numpy、scipy、matplotlib、scikit-learn...
```    

***
***

​    
**ERROR 錯誤紀錄**
=====

***
***
    
**Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-j_ho_m/setuptools/**
-----
    
```sql
pip3 install --upgrade setuptools
```

***
***
    
**載不下來可以添加參數**
-----

```sql
--use-deprecated=backtrack-on-build-failures
``` 

***
***
   
```sql
curl https://bootstrap.pypa.io/get-pip.py > get-pip.py
    
python get-pip.py
    
pip -V , pip3 -V
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
> URL: https://laurance.eu.org/posts/linux-python2.7-%E5%8D%87%E7%B4%9A%E6%88%90-python3.6/  

