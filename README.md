# Ruby SDK

为方便客户使用美团云服务，特提供调用MOS API的Ruby SDK  

## 1. 安装

### 在命令行下直接使用RubyGems进行安装:

    $ sudo gem install mos_sdk
    

访问MOS控制台的 `API页面 <https://mos.meituan.com/console/#api>`_ 获得API入口URL、ACCESS_Key和ACCESS_Secret。
    
## 2. 使用
通过Sdk生成客户端实例，API接口说明参见"lib/mos_sdk.rb或doc/MosSdk/Client.html"。  
示例代码如下:  

```
require "mos_sdk"  
key = 'MOS_ACCESS_KEY'  
secret = 'MOS_ACCESS_SECRET'  
url = 'MOS_ACCESS_URL'  
cli = MosSdk::Client.new(key, secret, url)
balance = cli.get_balance()
puts balance
```

