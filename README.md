# MOSAPI_RUBY
**编码规范参照 https://github.com/bbatsov/rubocop**
## 1. 工程结构说明
mos/sdk/common  -->sdk的基类文档   
mos/sdk/v1  -->sdk client  
doc  -->对应说明文档  
test -->对应测试文档
## 2. 使用SDK
通过Client生成客户端实例，API接口说明参见"mos/sdk/v1/client.rb文档或doc/Client.html"。  
示例代码如下:  

```
require "mos/sdk/v1/client"  
key = 'MOS_ACCESS_KEY'  
secret = 'MOS_ACCESS_SECRET'  
url = 'https://mosapi.meituan.com/mcsapi/v1'  
cli = Client(key, secret, url)  
balance = cli.GetBalance()  
puts balance
```

