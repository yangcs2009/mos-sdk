Ruby SDK
===========


为了方便客户使用美团云服务，我们提供了方便调用MOS API的Ruby SDK，用户可以通过调用Ruby SDK在自己的程序中实现对美团云资源的控制。

安装
----

使用gem安装
~~~~~~~~~~~
在命令行下可以直接使用gem进行安装::

    sudo gem install mos-sdk

从源码安装
~~~~~~~~~~
从 `github下载最新版 <https://github.com/meituan/mcsapi_ruby/archive/master.zip>`_ 代码并解压，或者执行如下命令获取源码::

    git clone https://github.com/meituan/mcsapi_ruby.git

进入mcsapi_ruby目录执行下述命令安装ruby SDK::

    sudo gem install

访问MOS控制台的 `API页面 <https://mos.meituan.com/console/#api>`_ 获得API入口URL、ACCESS Key和Secret。

使用Ruby SDK
-------------

通过Mos::Client生成客户端实例，API接口说明实现参见Ruby SDK API doc文档 

示例代码如下：

::

        require "mos-sdk"

        key = 'MOS_ACCESS_KEY'
        secret = 'MOS_ACCESS_SECRET'
        url = 'MOS_ACCESS_URL'

        cli = MOS::Client(key, secret, url)

        balance = cli.get_balance()
        puts balance

