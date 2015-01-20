$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require "test/unit"
require "mos-sdk"

# 此文档为mos-sdk对应测试文档，遵循Ruby单元测试框架协议编写
class SdkTest <Test::Unit::TestCase

  # - Called before every test method runs. Can be used
  # - to set up fixture information.
  def setup
    # handler
    @cli = MOS::Client.new('MOS_ACCESS_KEY', 'MOS_ACCESS_SECRET', 'MOS_ACCESS_URL')
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.
  def teardown
    # Do nothing
  end

  def test_describe_instance_types
    assert_equal({"InstanceType" =>
                      [{"instanceTypeId" => "5a96d81a-ee1a-48be-b65b-85fe5cf6d1bb",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "16",
                        "volume" => "0",
                        "memory" => "32768",
                        "instanceType" => "C16_M32"},
                       {"instanceTypeId" => "ad14ddb6-b2e3-4fd8-8a1b-048371056bba",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "16",
                        "volume" => "0",
                        "memory" => "16384",
                        "instanceType" => "C16_M16"},
                       {"instanceTypeId" => "6aea030b-b087-485e-9493-ca3700c286f7",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "16",
                        "volume" => "0",
                        "memory" => "49152",
                        "instanceType" => "C16_M48"},
                       {"instanceTypeId" => "06bd421a-1d01-40ad-a1d5-1da915a27a00",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "16",
                        "volume" => "0",
                        "memory" => "24576",
                        "instanceType" => "C16_M24"},
                       {"instanceTypeId" => "50e6b904-31f2-4762-9c9a-dd0a162ed3ff",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "12",
                        "volume" => "0",
                        "memory" => "49152",
                        "instanceType" => "C12_M48"},
                       {"instanceTypeId" => "23ef60cf-20e5-4076-96f4-c24f5fd4d959",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "12",
                        "volume" => "0",
                        "memory" => "32768",
                        "instanceType" => "C12_M32"},
                       {"instanceTypeId" => "85acefad-d0a2-42de-b749-a6a669533f9c",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "12",
                        "volume" => "0",
                        "memory" => "24576",
                        "instanceType" => "C12_M24"},
                       {"instanceTypeId" => "516efa96-3e6d-43f1-b504-30957733f3d5",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "12",
                        "volume" => "0",
                        "memory" => "16384",
                        "instanceType" => "C12_M16"},
                       {"instanceTypeId" => "72b1efe2-dee5-4e8e-bc83-40a47521462d",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "12",
                        "volume" => "0",
                        "memory" => "12288",
                        "instanceType" => "C12_M12"},
                       {"instanceTypeId" => "38f2dda6-ccf2-4d38-941f-7e65df5a9ebb",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "16",
                        "volume" => "0",
                        "memory" => "65536",
                        "instanceType" => "C16_M64"},
                       {"instanceTypeId" => "8f95bb97-df9c-47a3-aa27-359cfea049d6",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "1",
                        "cpu" => "2",
                        "volume" => "491520",
                        "memory" => "4096",
                        "instanceType" => "M_mem_4_disk_480_net_1"},
                       {"instanceTypeId" => "b980c07e-af85-4ce7-9f3c-cb650f8997ac",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "100",
                        "cpu" => "1",
                        "volume" => "102400",
                        "memory" => "512",
                        "instanceType" => "T_disk"},
                       {"instanceTypeId" => "193ad6d9-ed5e-464f-aec6-43e86bdabb9b",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "8",
                        "volume" => "0",
                        "memory" => "16384",
                        "instanceType" => "C8_M16"},
                       {"instanceTypeId" => "4e01bc1d-e3a3-4cb9-af1e-64af7dd8b71d",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "8",
                        "volume" => "0",
                        "memory" => "24576",
                        "instanceType" => "C8_M24"},
                       {"instanceTypeId" => "5202458a-9c3b-42b5-b630-f58784f255d5",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "4",
                        "volume" => "0",
                        "memory" => "6144",
                        "instanceType" => "C4_M6"},
                       {"instanceTypeId" => "77efb93d-c54a-4146-861f-5aa279de3913",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "8",
                        "volume" => "0",
                        "memory" => "32768",
                        "instanceType" => "C8_M32"},
                       {"instanceTypeId" => "7941f40c-7bb4-4c91-a182-2166af8deb51",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "4",
                        "volume" => "0",
                        "memory" => "12288",
                        "instanceType" => "C4_M12"},
                       {"instanceTypeId" => "92764747-2746-474b-afbe-e026d6d629c5",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "8",
                        "volume" => "0",
                        "memory" => "12288",
                        "instanceType" => "C8_M12"},
                       {"instanceTypeId" => "93391751-870e-4937-977e-3d8b760a1018",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "4",
                        "volume" => "0",
                        "memory" => "4096",
                        "instanceType" => "C4_M4"},
                       {"instanceTypeId" => "9813e61a-53b9-4afe-9c5e-a443106961ab",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "2",
                        "volume" => "0",
                        "memory" => "6144",
                        "instanceType" => "C2_M6"},
                       {"instanceTypeId" => "b06981a6-2699-44d1-83b1-bb41e6b97177",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "2",
                        "volume" => "0",
                        "memory" => "8192",
                        "instanceType" => "C2_M8"},
                       {"instanceTypeId" => "c4818cd6-3416-49e9-9f47-07fffdbffa23",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "4",
                        "volume" => "0",
                        "memory" => "16384",
                        "instanceType" => "C4_M16"},
                       {"instanceTypeId" => "c4a9e960-982a-4be0-993d-f7a68b4a9f82",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "8",
                        "volume" => "0",
                        "memory" => "8192",
                        "instanceType" => "C8_M8"},
                       {"instanceTypeId" => "cf946075-025c-4870-82b6-695245fdb3f7",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "4",
                        "volume" => "0",
                        "memory" => "8192",
                        "instanceType" => "C4_M8"},
                       {"instanceTypeId" => "026745cb-b4e0-403c-9fa0-ff97f9293a0a",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "1",
                        "volume" => "0",
                        "memory" => "1024",
                        "instanceType" => "C1_M1"},
                       {"instanceTypeId" => "4468768e-1e78-453b-b671-f79733463369",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "2",
                        "volume" => "0",
                        "memory" => "4096",
                        "instanceType" => "C2_M4"},
                       {"instanceTypeId" => "4cf6b17e-864b-4d35-81e9-5b1c9d28a12e",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "1",
                        "volume" => "0",
                        "memory" => "4096",
                        "instanceType" => "C1_M4"},
                       {"instanceTypeId" => "b93f75e4-9051-45c5-b43d-85737d97a3b6",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "2",
                        "volume" => "0",
                        "memory" => "2048",
                        "instanceType" => "C2_M2"},
                       {"instanceTypeId" => "e1c8e3e6-c891-42d4-ac89-34b9657dbb80",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "0",
                        "cpu" => "1",
                        "volume" => "0",
                        "memory" => "2048",
                        "instanceType" => "C1_M2"},
                       {"instanceTypeId" => "2a62da91-8220-434f-b613-bac7f2385247",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "100",
                        "cpu" => "1",
                        "volume" => "0",
                        "memory" => "512",
                        "instanceType" => "T"},
                       {"instanceTypeId" => "3588d89b-dc58-40d1-8240-c0ffb1094eb8",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "100",
                        "cpu" => "6",
                        "volume" => "102400",
                        "memory" => "8196",
                        "instanceType" => "XL"},
                       {"instanceTypeId" => "8278f22a-c25e-4d51-8b94-2a76efa40c59",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "100",
                        "cpu" => "4",
                        "volume" => "51200",
                        "memory" => "4096",
                        "instanceType" => "L"},
                       {"instanceTypeId" => "6c34343c-0568-4734-8456-956028613b81",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "100",
                        "cpu" => "2",
                        "volume" => "30720",
                        "memory" => "2048",
                        "instanceType" => "M"},
                       {"instanceTypeId" => "03631ab6-eccd-4e59-8906-e18385f69f2e",
                        "internalBandwidth" => "0",
                        "externalBandwidth" => "100",
                        "cpu" => "1",
                        "volume" => "0",
                        "memory" => "1024",
                        "instanceType" => "S"}]}, @cli.describe_instance_types, 'test_describe_instance_types failed!')
  end

  def test_describe_templates
    assert_equal({"Template" =>
                      [{"status" => "active",
                        "checksum" => "712abaa93900b74de6a7494172aaa458",
                        "size" => "413007872",
                        "templateName" => "CoreOS",
                        "templateId" => "320bbeb9-788f-4e7b-86af-7ea377b6a99e"},
                       {"status" => "active",
                        "checksum" => "5b2565a8ee8f939b8276f52a4879573e",
                        "size" => "3325624320",
                        "templateName" => "WinSrv-2008-R2-DataCenter-20140721",
                        "templateId" => "903a80e2-40cc-4ad1-8154-a819ad24bbbf"},
                       {"status" => "active",
                        "checksum" => "7912e8b25ba0db1c0cac49e135216251",
                        "size" => "1104412672",
                        "templateName" => "CentOS-7.0-x86_64-20140709",
                        "templateId" => "1f133842-62cc-4928-b5b6-e552311c4d3f"},
                       {"status" => "active",
                        "checksum" => "0509c8e225e34935b123766d24f92611",
                        "size" => "384565248",
                        "templateName" => "Ubuntu-12.04-amd64-20141203",
                        "templateId" => "fa1026fe-c082-4ead-8458-802bf65ca64c"},
                       {"status" => "active",
                        "checksum" => "614d13db0a3206044c8e2cab726b6bac",
                        "size" => "437518336",
                        "templateName" => "Ubuntu-14.04-amd64-20141203",
                        "templateId" => "e5037c3b-4e7d-4bb3-b904-603c6a3c2c6d"},
                       {"status" => "active",
                        "checksum" => "c59a3f25e6773020dbd500c22b863925",
                        "size" => "858783744",
                        "templateName" => "CentOS-6.5-x86_64-20141202",
                        "templateId" => "9bfebf3b-b628-488a-87bb-40335d2d4322"},
                       {"status" => "active",
                        "checksum" => "44a427d056e0b326c144d17e9aa7b931",
                        "size" => "5564071936",
                        "templateName" => "Windows8_20140506",
                        "templateId" => "de9edc0c-f4ba-40b8-ad0d-b09ba172988b"},
                       {"status" => "active",
                        "checksum" => "432e50764e4ed50bd96b8ff50384c9d4",
                        "size" => "2726166528",
                        "templateName" => "Win7-SP1-i386-20141210",
                        "templateId" => "cd1b5eaa-6dc2-4b84-b322-e37174846054"},
                       {"status" => "active",
                        "checksum" => "d9c7167d5e1b9f47cdad1a4e999bab63",
                        "size" => "3506896896",
                        "templateName" => "windows2008.r2.x86_64.virtio-20140506",
                        "templateId" => "345f9cbd-9dae-4604-a9d4-57f02d3b698c"},
                       {"status" => "active",
                        "checksum" => "ea9cc0614ca681453c10468a52a96394",
                        "size" => "1241448448",
                        "templateName" => "windows2003.r2.sp2.x86_64.virtio-20140506",
                        "templateId" => "69971691-f80e-450a-a3d9-9269705638dd"},
                       {"status" => "active",
                        "checksum" => "3ece3aeba6bbace41df6579c75725e17",
                        "size" => "3509583872",
                        "templateName" => "windows_srv_2008",
                        "templateId" => "b9508150-c6e4-4b56-8c4e-ea4a13b49139"},
                       {"status" => "active",
                        "checksum" => "994029270581683a7e6d6294f998b631",
                        "size" => "303562752",
                        "templateName" => "Debian-7.0.0-amd64-20130516",
                        "templateId" => "73ceb37b-7f2a-4daa-9953-b6cd53f05be1"},
                       {"status" => "active",
                        "checksum" => "872db54f4dc652619f97f06cb77f08da",
                        "size" => "3717005312",
                        "templateName" => "webdriver-win7",
                        "templateId" => "f7421136-52bf-4dbc-978a-b58eb71a7b07"},
                       {"status" => "active",
                        "checksum" => "ad478819fe645a7538a61a1aa577a53d",
                        "size" => "1916665856",
                        "templateName" => "webdriver-winXP",
                        "templateId" => "d228b470-877d-4979-880d-73a4047dc8d3"},
                       {"status" => "active",
                        "checksum" => "e2580dd2fceb91db3ed9491f8d079a67",
                        "size" => "532152320",
                        "templateName" => "CentOS6.4-x86_64-20130419",
                        "templateId" => "c67e392d-462d-4ae3-90fa-ecc2851bb1bf"},
                       {"status" => "active",
                        "checksum" => "aa467f9ba7e09d0a8b9d5b242cd6f476",
                        "size" => "1189085184",
                        "templateName" => "WindowsXP_SP3_X86",
                        "templateId" => "30761f7c-6009-4d36-ac7c-962529afcbe8"}]}, @cli.describe_templates, 'test_describe_templates failed!')
  end

  def test_get_balance
    assert_equal({"timestamp" => "2014-12-19T03:06:56Z", "balance" => "2400.0"}, @cli.get_balance, 'test_GetBalance failed!')
  end

  def test_describe_instances
    assert_equal({"Instance" =>
                      {"status" => "running",
                       "availabilityZoneId" => "6f2ca2ed-0ae9-4321-9d82-004783fa2f6c",
                       "instanceId" => "860832f1-99b8-4715-a64f-49ce53387532",
                       "instanceType" => "C4_M4",
                       "volume" => "132096",
                       "ipAddresses" => "192.168.4.249",
                       "memory" => "4096",
                       "instanceName" => "demo",
                       "cpu" => "4"}}, @cli.describe_instances, 'test_get_balance failed!')
  end

  def test_describe_instance_volumes
    assert_equal({"InstanceVolume" =>
                      [{"index" => "0",
                        "instanceId" => "860832f1-99b8-4715-a64f-49ce53387532",
                        "volumeName" => "vdisk_demo_1416884224.370007",
                        "driver" => "virtio",
                        "volumeId" => "c2758f9e-2a87-4d06-a84e-13ac02c8b52d",
                        "cacheMode" => "none",
                        "volumeSize" => "25600",
                        "instanceName" => "demo"},
                       {"index" => "1",
                        "instanceId" => "860832f1-99b8-4715-a64f-49ce53387532",
                        "volumeName" => "vdisk_demo_1416884224.552405",
                        "driver" => "virtio",
                        "volumeId" => "8fc7fceb-48c5-4cb8-98c7-5ea1cfd27ceb",
                        "cacheMode" => "none",
                        "volumeSize" => "4096",
                        "instanceName" => "demo"},
                       {"index" => "2",
                        "instanceId" => "860832f1-99b8-4715-a64f-49ce53387532",
                        "volumeName" => "vdisk_demo_1416884224.689630",
                        "driver" => "virtio",
                        "volumeId" => "fb17ec7c-8f16-4af0-9933-77ffed5a8295",
                        "cacheMode" => "none",
                        "volumeSize" => "102400",
                        "instanceName" => "demo"}]}, @cli.describe_instance_volumes('860832f1-99b8-4715-a64f-49ce53387532'), 'test_describe_instance_volumes failed!')
  end

  def test_describe_network_interfaces
    assert_equal({"InstanceNetworkInterface" =>
                      {"networkId" => "c67a00f2-ce17-4f2a-b536-4ffad46b89f3",
                       "index" => "0",
                       "macAddress" => "00:22:16:d5:f1:78",
                       "instanceId" => "860832f1-99b8-4715-a64f-49ce53387532",
                       "instanceName" => "demo",
                       "driver" => "virtio",
                       "bandwidth" => "100",
                       "networkName" => "vnet4",
                       "ipAddress" => "192.168.4.249"}}, @cli.describe_network_interfaces('860832f1-99b8-4715-a64f-49ce53387532'), 'test_describe_network_interfaces failed!')
  end

  def test_renew_instance
    assert_equal({"return" => "True"}, @cli.renew_instance('860832f1-99b8-4715-a64f-49ce53387532'), 'test_renew_instance failed!')
  end

  def test_renew_instance1
    assert_equal({"return" => "True"}, @cli.renew_instance('860832f1-99b8-4715-a64f-49ce53387532', '2M'), 'test_renew_instance1 failed!')
  end

  def test_get_instance_contract_info
    assert_equal({"startedAt" => "2014-11-25T02:57:00Z",
                  "extendTo" => "2016-01-01T02:57:00Z",
                  "expireAt" => "2015-12-25T02:57:00Z"}, @cli.get_instance_contract_info('860832f1-99b8-4715-a64f-49ce53387532'), 'test_get_instance_contract_info failed!')
  end

  def test_describe_instance_status
    assert_equal({"status" => "running"}, @cli.describe_instance_status('860832f1-99b8-4715-a64f-49ce53387532'), 'test_describe_instance_status failed!')
  end

  def test_get_password_data
    assert_equal({"timestamp" => "2014-11-25T02:57:17Z",
                  "account" => "root",
                  "passwordData" => "BZvHRKw7XbDg"}, @cli.get_password_data('860832f1-99b8-4715-a64f-49ce53387532'), 'test_get_password_data failed!')
  end

  def test_stop_instance
    assert_equal({"return" => "True"}, @cli.stop_instance('860832f1-99b8-4715-a64f-49ce53387532'), 'test_stop_instance failed!')
  end

  def test_start_instance
    assert_equal({"return" => "True"}, @cli.start_instance('860832f1-99b8-4715-a64f-49ce53387532'), 'test_start_instance failed!')
  end

  def test_reboot_instance
    assert_equal({"return" => "True"}, @cli.reboot_instance('860832f1-99b8-4715-a64f-49ce53387532'), 'test_reboot_instance failed!')
  end

  # 省略datadisk、bandwidth无法创建，因为每次创建虚机id不同，assert_equal无法为真，只要创建成功即可
  def test_create_instance
    assert_equal({"Instance" =>
                      {"status" => "schedule",
                       "instanceTypeId" => "026745cb-b4e0-403c-9fa0-ff97f9293a0a",
                       "instanceId" => "53146fdc-3a73-443b-a8e6-3602afd50d6e",
                       "cpu" => "1",
                       "ipAddresses" => nil,
                       "memory" => "1024",
                       "instanceName" => "yangchangsheng",
                       "instanceType" => "C1_M1"}}, @cli.create_instance('fa1026fe-c082-4ead-8458-802bf65ca64c', 'C1_M1', nil, nil, nil, datadisk=9, bandwidth=2), 'test_create_instance failed!')
  end

  def test_terminate_instance
    assert_equal({"return" => "True"}, @cli.terminate_instance('66474718-388f-4cde-a983-fbd610c2041f'), 'test_terminate_instance failed!')
  end

  def test_rebuild_instance_root_image
    assert_equal({"return" => "True"}, @cli.rebuild_instance_root_image('8e16d307-70ed-4894-8e7f-dfbe18f30478'), 'test_rebuild_instance_root_image failed!')
  end

  def test_rebuild_instance_root_image1
    assert_equal({"return" => "True"}, @cli.rebuild_instance_root_image('8e16d307-70ed-4894-8e7f-dfbe18f30478', image_id='30761f7c-6009-4d36-ac7c-962529afcbe8'), 'test_rebuild_instance_root_image1 failed!')
  end

  def test_change_instance_type
    assert_equal({"Instance" =>
                      {"status" => "disk",
                       "instanceTypeId" => "b93f75e4-9051-45c5-b43d-85737d97a3b6",
                       "availabilityZoneId" => "6f2ca2ed-0ae9-4321-9d82-004783fa2f6c",
                       "instanceId" => "9ffcf106-1c4f-4748-b54e-94aeedc03a0d",
                       "instanceType" => "C2_M2",
                       "ipAddresses" => "192.168.4.108",
                       "memory" => "2048",
                       "instanceName" => "ubuntu12",
                       "cpu" => "2"}}, @cli.change_instance_type('9ffcf106-1c4f-4748-b54e-94aeedc03a0d', 'C2_M2', duration = '2M', datadisk=10, bandwidth=3), 'test_change_instance_type failed!')
  end

  def test_describe_key_pairs
    assert_equal(nil, @cli.describe_key_pairs(), 'test_describe_key_pairs failed!')
  end

  def test_get_instance_metadata
    assert_equal({"os_name" => "Linux",
                  "os_version" => "6.5",
                  "kvm" => "disabled",
                  "k1" => "12",
                  "app_tags" => "io_bound",
                  "k2" => "34",
                  "storage_type" => "rotational",
                  "os_distribution" => "CentOS"}, @cli.get_instance_metadata('860832f1-99b8-4715-a64f-49ce53387532'), 'test_get_instance_metadata failed!')
  end

  def test_put_instance_metadata
    assert_equal({"return" => "True"}, @cli.put_instance_metadata('860832f1-99b8-4715-a64f-49ce53387532', {'k1' => 11, 'k2' => 14}), 'test_put_instance_metadata failed!')
  end

#-- todo
#++
  def test_import_key_pair
    assert_equal({"return" => "True"}, @cli.import_key_pair('key_name', 'public_key'), 'test_import_key_pair failed!')
  end

  def test_delete_key_pair
    assert_equal({"return" => "True"}, @cli.delete_key_pair('key_id'), 'test_delete_key_pair failed!')
  end

  def test_create_template
    assert_equal({"return" => "True"}, @cli.create_template('860832f1-99b8-4715-a64f-49ce53387532', 'templateDemo'), 'test_create_template failed!')
  end

  def test_delete_template
    assert_equal({"return" => "True"}, @cli.delete_template('1864494f-27f2-46ae-99dc-452962d4288c'), 'test_delete_template failed!')
  end

end