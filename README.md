# RUBY SDK

为方便客户使用，特提供调用MOS API的Ruby SDK  

## 1. 工程结构说明

lib / sdk / base.rb  -->sdk的基类文档
   
lib / sdk.rb  -->sdk实现文档
  
doc  -->对应说明文档 
 
test -->对应测试文档

## 2. 安装

Add this line to your application's Gemfile:

```ruby
gem 'sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sdk
    
## 2. 使用
通过Sdk生成客户端实例，API接口说明参见"lib/sdk.rb或doc/Sdk/Sdk.html"。  
示例代码如下:  

```
require "sdk"  
key = 'MOS_ACCESS_KEY'  
secret = 'MOS_ACCESS_SECRET'  
url = 'MOS_ACCESS_URL'  
cli = Sdk::Sdk.new(key, secret, url)
balance = cli.get_balance()
puts balance
```

