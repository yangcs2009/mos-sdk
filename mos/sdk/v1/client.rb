# -*- coding: utf-8 -*-
$:.unshift File.join(File.dirname(__FILE__), '..', 'common')
require 'base.rb'
require 'utils.rb'

# 基类函数为Base，sdk的实现类
class Client < Base
  # 构造函数，实现继承基类函数
  def initialize(access, secret, url, format='xml', timeout=300, debug=false)
    super(access, secret, url, format, timeout, debug)
  end

  # 获取所有虚拟机类型
  # - @param [Integer] limit 最大返回数量，用于分页控制
  # - @param [Integer] offset 返回偏移量，用于分页控制
  # - @param [Hash] filters 过滤条件，key/value分别指定过滤字段名称和值，支持的字段名称为：name, status
  # - @return [Hash] 所有虚拟机信息
  def describe_instance_types(limit=0, offset=0, filters=nil)
    kwargs = {}
    self.parse_array_params(limit, offset, filters, kwargs) # parse_list_params  父类函数
    val = self.request('DescribeInstanceTypes', *kwargs)
    val['InstanceTypeSet']
  end

  # 获得所有虚拟机模板
  # - @return [Hash] 模板列表
  def describe_templates()
    val = self.request('DescribeTemplates')
    val['TemplateSet']
  end

  # 获取帐户余额和最近更新时间
  # - @return [Hash] 帐户余额和最近更新时间
  def get_balance()
    self.request('GetBalance')
  end

  # 获得所有虚拟机
  # - @param [Array] ids 期望获取的虚拟机ID列表
  # - @param [Array] names 期望获取信息的虚拟机名称列表
  # - @param [Integer] limit  最多返回数量
  # - @param [Integer] offset 返回虚拟机的偏移量，用于分页显示
  # - @param [Hash] filters  过滤器，一个hash，包含过滤字段名和值，可能过滤字段为：name, status
  # - @return [Hash] 虚拟机列表
  def describe_instances(ids=nil, names=nil, limit=0, offset=0, filters=nil)
    kwargs = {}
    kwargs['InstanceId'] = ids if ids.kind_of?(Array) && ids.size() > 0
    kwargs['InstanceName'] = names if names.kind_of?(Array) && names.size() > 0
    self.parse_array_params(limit, offset, filters, kwargs)
    val = self.request('DescribeInstances', *kwargs)
    val['InstanceSet']
  end

  # 获取指定虚拟机的虚拟磁盘信息
  # - @param [String] iid  虚拟机ID
  # - @param [Integer] limit  最大返回数量，用于分页控制
  # - @param [Integer] offset 返回的偏移量，用于分页控制
  # - @param [Hash] filters 返回结果过滤条件，由hash的key/value指定过滤字段名和值
  # - @return [Hash] 指定虚拟机磁盘列表
  def describe_instance_volumes(iid, limit=0, offset=0, filters=nil)
    kwargs = {}
    kwargs['InstanceId'] = iid
    self.parse_array_params(limit, offset, filters, kwargs)
    val = self.request('DescribeInstanceVolumes', *kwargs)
    val['InstanceVolumeSet']
  end

  # 获取指定虚拟机的网络接口（虚拟网卡）信息
  # - @param [String] iid 虚拟机ID
  # - @param [Integer] limit 最大返回数量，用于分页控制
  # - @param [Integer] offset 返回的偏移量，用于分页控制
  # - @param [Hash] filters 返回结果过滤条件，由hash的key/value指定过滤字段名和值
  # @return [Hash] 指定虚拟机的网络接口（虚拟网卡）信息
  def describe_network_interfaces(iid, limit=0, offset=0, filters=nil)
    kwargs = {}
    kwargs['InstanceId'] = iid
    self.parse_array_params(limit, offset, filters, kwargs)
    val = self.request('DescribeInstanceNetworkInterfaces', *kwargs)
    val['InstanceNetworkInterfaceSet']
  end

  # 虚拟机租期续费
  # - @param [String] iid
  # - @param [String] duration 续费租期，缺省为'1M'，即一个月
  def renew_instance(iid, duration=nil)
    kwargs = {}
    kwargs['InstanceId'] = iid
    unless duration.nil?
      (/^\d+[HhMm]$/.match(duration)) ? (kwargs['Duration'] = duration) : (raise Exception("Illegal duration %s" % duration))
    end
    self.request('RenewInstance', *kwargs)
  end

  # 获取虚拟机的租期信息
  # - @param [String] iid
  # - @return [Hash]  虚拟机租期信息，包含过期时间、自动删除时间
  def get_instance_contract_info(iid)
    kwargs = {}
    kwargs['InstanceId'] = iid
    self.request('GetInstanceContractInfo', *kwargs)
  end

  # 创建虚拟机,创建时要提供datadisk和bandwidth参数
  # - @param [String] imageid 系统模板ID
  # - @param [String] itype 虚拟机类型ID  例如 C4_M4 代表四核 4G内存
  # - @param [String] duration 虚拟机租期, 缺省为'1M'，即一个月
  # - @param [String] name 虚拟机名称(可选)
  # - @param [String] keypair 虚拟机使用的SSH密钥ID
  # - @param [Integer] datadisk 指定创建虚拟机使用的额外数据盘，单位为10GB
  # - @param [Integer] bandwidth 指定创建虚拟机使用的额外带宽，单位为Mbps
  # - @return [Hash]   创建成功的虚拟机信息
  def create_instance(imageid, itype, duration=nil, name=nil, keypair=nil, datadisk=nil, bandwidth=nil)
    kwargs = {}
    kwargs['ImageId'] = imageid
    kwargs['InstanceType'] = itype
    unless duration.nil?
      /^\d+[HhMm]$/.match(duration) ? kwargs['Duration'] = duration : (raise Exception('Illegal duration format'))
    end

    kwargs['InstanceName'] = name unless name.nil?
    kwargs['KeyName'] = keypair unless keypair.nil?
    kwargs['ExtraExtDisksize'] = datadisk*10 unless datadisk.nil?
    kwargs['ExtraExtBandwidth'] = bandwidth unless bandwidth.nil?
    val = self.request('CreateInstance', *kwargs)
    val['Instance']
  end

  # 获取虚拟机的状态
  # - @param [String] iid 虚拟机ID
  # - @return [Hash] 虚拟机状态
  def describe_instance_status(iid)
    kwargs = {}
    kwargs['InstanceId'] = iid
    val = self.request('DescribeInstanceStatus', *kwargs)
    val['InstanceStatus']
  end

  # 获取虚拟机的Login帐户信息
  # - @param [String] iid 虚拟机ID
  # - @param [String] key_file 私钥文件路径，如果虚拟机使用了SSH密钥，需要指定私钥解密password
  # - @return [Hash] 虚拟机Login信息，包含帐户名称、密码，如果使用SSH密钥，则还包含密钥ID和名称
  def get_password_data(iid, key_file=nil)
    kwargs = {}
    kwargs['InstanceId'] = iid
    val = self.request('GetPasswordData', *kwargs)
    if val.has_key?('passwordData') && val.has_key?('keypairName')
      if key_file.nil?
        raise Exception('Password is encrypted, please specify private key of keypair %s' % val['keypairName'])
      else
        begin
          f = open(key_file)
        rescue
          puts 'fail to open file'
          exit(-1)
        end

        key = f.read()
        f.close()
        #todo   decrypt_base64  待测
        #val['passwordData'] = utils.decrypt_base64(key, val['passwordData'])
        # val['passwordData']
        val['passwordData']=Base64.decode64(
            OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), key, val['passwordData'])
        ).strip
      end
    end
    val
  end

  # 启动虚拟机
  # - @param [String] iid 虚拟机ID
  def start_instance(iid)
    kwargs = {}
    kwargs['InstanceId'] = iid
    self.request('StartInstance', *kwargs)
  end

  # 停止虚拟机
  # - @param [String] iid 虚拟机ID
  # - @param [Symbol] force 是否强制停止虚拟机
  def stop_instance(iid, force=false)
    kwargs = {}
    kwargs['InstanceId'] = iid
    kwargs['Force'] = force if force
    self.request('StopInstance', *kwargs)
  end

  # 重启虚拟机
  # - @param [String] iid 虚拟机ID
  def reboot_instance(iid)
    kwargs = {}
    kwargs['InstanceId'] = iid
    self.request('RebootInstance', *kwargs)
  end

  # 删除虚拟机
  # - @param [String] iid 虚拟机ID
  def terminate_instance(iid)
    kwargs = {}
    kwargs['InstanceId'] = iid
    self.request('TerminateInstance', *kwargs)
  end

  # 重置虚拟机系统磁盘
  # - @param [String] iid 虚拟机ID
  # - @param [String] image_id 将虚拟机系统磁盘用指定镜像模板重置，如果无该参数，则使用原镜像模板重置
  def rebuild_instance_root_image(iid, image_id=nil)
    kwargs = {}
    kwargs['InstanceId'] = iid
    kwargs['ImageId'] = image_id if !(image_id.nil?) && image_id.size > 0
    self.request('RebuildInstanceRootImage', *kwargs)
  end

  # 更改虚拟机类型
  # - @param [String] iid 虚拟机ID
  # - @param [String] itype  指定更改的虚拟机类型
  # - @param [String] duration 指定更改后的初始租期，缺省为'1M'，即一个月
  # - @param [Integer] datadisk 指定创建虚拟机使用的额外数据盘，单位为10GB
  # - @param [Integer] bandwidth 指定创建虚拟机使用的额外带宽，单位为Mbps
  def change_instance_type(iid, itype, duration=nil, datadisk=nil, bandwidth=nil)
    kwargs = {}
    kwargs['InstanceId'] = iid
    kwargs['InstanceType'] = itype
    unless duration.nil?
      /^\d+[HhMm]$/.match(duration) ? kwargs['Duration'] = duration : (raise Exception('Illegal duration format'))
    end

    kwargs['ExtraExtDisksize'] = datadisk*10 unless datadisk.nil?
    kwargs['ExtraExtBandwidth'] = bandwidth unless bandwidth.nil?

    self.request('ChangeInstanceType', *kwargs)
  end

  # 获取虚拟机的metadata
  # - @param [String] iid 虚拟机ID
  # - @return [Hash]  一个hash,包含虚拟机所有metadata的key/value
  def get_instance_metadata(iid)
    kwargs = {}
    kwargs['InstanceId'] = iid
    val = self.request('GetInstanceMetadata', *kwargs)
    val['InstanceMetadata']
  end

  # 修改虚拟机的metadata
  # - @param [String] iid 虚拟机ID
  # - @param [Hash] data  需要增加或修改的metadata信息
  def put_instance_metadata(iid, data)
    kwargs = {}
    kwargs['InstanceId'] = iid
    names = []
    values = []
    data.each do |key, value|
      names.push(key)
      values.push(value)
    end
    kwargs['Name'] = names
    kwargs['Value'] = values
    self.request('PutInstanceMetadata', *kwargs)
  end

  # 获取用户的SSH密钥对
  # - @param [Integer] limit 最大返回数量，用于分页控制
  # - @param [Integer] offset 返回偏移量，用于分页控制
  # - @param [Hash] filters 过滤条件，key/value分别指定过滤字段名称和值，支持的字段名称为：name
  # - @return [Hash]  包含SSH密钥对列表
  def describe_key_pairs(limit=0, offset=0, filters=nil)
    kwargs = {}
    self.parse_array_params(limit, offset, filters, kwargs)
    val = self.request('DescribeKeyPairs', *kwargs)
    val['KeyPairSet']
  end

  # 导入一个用户的SSH公钥，并创建一个SSH密钥对
  # - @param [String] name 密钥对名称
  # - @param [String] pubkey SSH公钥信息
  # - @return [Hash] 创建的SSH密钥对信息
  def import_key_pair(name, pubkey)
    kwargs = {}
    kwargs['KeyName'] = name
    kwargs['PublicKeyMaterial'] = pubkey
    val = self.request('ImportKeyPair', *kwargs)
    val['KeyPair']
  end

  # 删除一个SSH密钥对
  # - @param [String] kid 密钥对ID
  def delete_key_pair(kid)
    kwargs = {}
    kwargs['KeyName'] = kid
    self.request('DeleteKeyPair', *kwargs)
  end

  # 保存虚拟机的模板
  # - @param [String] iid 虚拟机ID
  # - @param [String] name 模板名称
  # - @param [String] notes 保存模板的说明
  # - @return [Hash] 请求是否成功
  def create_template(iid, name, notes=nil)
    kwargs = {}
    kwargs['InstanceId'] = iid
    kwargs['Name'] = name
    kwargs['Notes'] = notes unless notes.nil?
    self.request('CreateTemplate', *kwargs)
  end

  # 删除一个模板
  # - @param [String] tid 模板ID
  def delete_template(tid)
    kwargs = {}
    kwargs['TemplateId'] = tid
    self.request('DeleteTemplate', *kwargs)
  end
end


=begin
2014.12.8
test code for class Client
=end
c = Client.new('c9b13af321f247a496f925d70ce001b3', '7013bacdb1d44e0a851aa8786f742596', 'https://192.168.2.33:8883')

# 开发机
#c1 = Client.new('8a29d475dc804ac6b1f335a2b96e5200', '41229efa5a074c9190d1f8b3d6948e33', 'https://192.168.4.249:8883')
=begin
export MOS_ACCESS=8a29d475dc804ac6b1f335a2b96e5200
export MOS_SECRET=41229efa5a074c9190d1f8b3d6948e33
export MOS_URL=https://192.168.4.249:8883
export MOS_REGION=LocalTest
=end
puts (c.get_balance)
# puts c.DescribeInstanceTypes(5,2)

# puts c1.DescribeTemplates
# puts c.DescribeInstanceVolumes('860832f1-99b8-4715-a64f-49ce53387532')
# puts c.GetInstanceContractInfo('860832f1-99b8-4715-a64f-49ce53387532')
# puts c.GetInstanceMetadata('860832f1-99b8-4715-a64f-49ce53387532')
# puts c.PutInstanceMetadata('860832f1-99b8-4715-a64f-49ce53387532',{'k1'=>12,'k2'=>34})
# puts c.DescribeKeyPairs
# puts c.CreateTemplate('860832f1-99b8-4715-a64f-49ce53387532','demo')
# puts c.DeleteTemplate 'ff2348d9-0a4d-4817-92b3-97b32ddfc40d'
# puts c.TerminateInstance('66474718-388f-4cde-a983-fbd610c2041f')
# c.CreateInstance('fa1026fe-c082-4ead-8458-802bf65ca64c', 'C1_M1', nil, nil, nil, datadisk=9, bandwidth=2)
# puts c.ChangeInstanceType('9ffcf106-1c4f-4748-b54e-94aeedc03a0d','C1_M2')
# puts c.GetPasswordData('860832f1-99b8-4715-a64f-49ce53387532')