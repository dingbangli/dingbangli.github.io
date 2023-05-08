+++
author = "Hugo Authors"
title = "Python2.7 升級成 Python3.6"
date = "2022-08-03"
#description = ""
categories = [
    "Python"
]
tags = [
    "Python",
]
image = "100.png"
+++


    # yum -y update
    # yum -y install vim wget
    # yum -y install python-setuptools
    # easy_install pip
    # yum -y install make gcc gcc-c++
    # yum -y install zlib-devel
    # yum -y install readline*
    # yum -y install openssl-devel
    # yum -y install tk-devel
    # yum -y install sqlite-devel
    
    $ wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz
    $ tar -zxvf Python-3.6.3.tgz
    $ cd Python-3.6.3
    $ ./configure --enable-loadable-sqlite-extensions
    $ make
    $ sudo make install
    
    # mv /usr/bin/python /usr/bin/python.bak
    # ln -s /usr/local/bin/python3 /usr/bin/python
    
    # vim /usr/bin/yum
    # vim /usr/libexec/urlgrabber-ext-down
    # vim /usr/bin/firewall-cmd
    # vim /usr/sbin/firewalld
    註：被​將每個文件的第一句話 #!/usr/bin/python 改為 #!/usr/bin/python2.7，保存退出即可
    
    # service firewalld restart
    # service firewalld status
    
    # pip install [packages]
       ex: numpy、scipy、matplotlib、scikit-learn...
    
    ERR:
    
    Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-j_ho_m/setuptools/
    pip3 install --upgrade setuptools
    
    載不下來可以添加參數
    XXX --use-deprecated=backtrack-on-build-failures
    
    curl https://bootstrap.pypa.io/get-pip.py > get-pip.py
    python get-pip.py
    
    pip -V , pip3 -V



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
