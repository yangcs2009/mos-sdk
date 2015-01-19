require "uri"
require "base64"
require "openssl"
require "net/http"
require "json"
require "logger"
require "rubygems"
require "crack"
require "erb"
include ERB::Util

module MOS
  class Base
  end
end

class MOS::Base
  attr_accessor :access, :secret, :url, :format, :timeout, :debug

  # 基类初始化函数
  # - @param [String] access
  # - @param [String] secret
  # - @param [String] url
  # - @param [String] format  默认为xml格式
  # - @param [Integer] timeout
  # - @param [] debug
  def initialize(access, secret, url, format='xml', timeout=300, debug=false)
    @access=access
    @secret=secret
    @url=url
    @format=format
    @timeout=timeout
    @debug=debug
  end

  def raw_request(action, *kwargs)
    self._request(action, *kwargs)
  end

  # 处理请求函数
  # - @param [String] action  函数名
  # - @param [Hash] kwargs  函数调用参数
  # - @return [HTTPResponse] 返回请求处理结果
  def _request(action, *kwargs)
    params = {}
    params['Action'] = action
    params['AWSAccessKeyId'] = self.access
    params['Timestamp'] = Time.now.strftime("%Y-%m-%dT%H:%M:%S.000Z")
    params['SignatureVersion'] = '2'
    params['SignatureMethod'] = 'HmacSHA256'

    unless kwargs.empty?
      kwargs.each do |k, v|
        if v.kind_of?(Array)
          i = 1
          v.each do |vi|
            params['%s.%d' % [k, i]] = vi
            i += 1
          end
        else
          params[k] = v
        end
      end
    end

    params['Format'] = self.format if self.format
    sig = self.get_signature(params)
    params['Signature'] = sig
    headers = {}
    headers['User-Agent'] = 'ruby-mosclient'
    data = URI.encode_www_form(params)
    puts self.url + '?' + data if self.debug

    uri = URI.parse(self.url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl=true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.request_post('/', data, headers)
  end

  # 签名函数
  # - @param [Hash] params  签名参数
  # - @return [String]  签名处理结果
  def get_signature(params) #signature method
    req = URI.parse(self.url)
    host = req.host
    endpoint = host + ':' + req.port.to_s
    path = req.path
    path = '/' if req.path == ''
    cred_dict = {'access' => self.access,
                 'host' => endpoint,
                 'verb' => 'POST',
                 'path' => path,
                 'params' => params,
    }
    params=Hash[params.sort]
    sha256_hmac(string_to_sign(cred_dict, params))
  end

  # 字符串格式化函数
  # - @param [Hash] cred_dict 认证信息
  # - @param [Hash] params 认证参数
  # - @return [String]  格式化结果
  def string_to_sign(cred_dict, params)
    [
        cred_dict['verb'],
        cred_dict['host'],
        cred_dict['path'],
        URI.encode_www_form(params),
    ].join("\n")
  end

  # sha256算法实现
  # - @param [String] value 加密内容
  # - @return [String]  加密结果
  def sha256_hmac(value)
    Base64.encode64(
        OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), self.secret, value)
    ).strip
  end

  # 请求/响应函数，核心处理由_request函数实现
  # - @param [String] action  函数名
  # - @param [Hash] kwargs  函数调用参数
  # - @return [Hash]  返回函数调用结果
  def request(action, *kwargs)
    resp = self._request(action, *kwargs)
    body = resp.body
    if self.debug
      puts body
    end

    # todo begin 中if...else  执行else
    begin
      if resp.header['Content-Type'].start_with?('application/json')
        body = JSON.parse(body)
      else
        body = Crack::XML.parse(body)
        body["#{action}Response"]
      end
    rescue
      return body
    end
  end

  # 结果格式化函数
  # - @param [Integer] limit  最大返回数量，用于分页控制
  # - @param [Integer] offset  返回偏移量，用于分页控制
  # - @param [Hash] filters  过滤条件，key/value分别指定过滤字段名称和值
  # - @param [Hash] kwargs  其他参数
  def parse_array_params(limit, offset, filters, kwargs)
    kwargs['Limit'] = limit if limit > 0
    kwargs['Offset'] = offset if offset > 0
    unless filters.nil?
      fidx = 1
      filters.each do |k, vs|
        kwargs['Filter.%d.Name' % fidx] = k
        vs = [vs] unless vs.kind_of?(Array)
        vidx = 1
        vs.each do |v|
          kwargs['Filter.%d.Value.%d' % [fidx, vidx]] = v
          vidx += 1
        end
        fidx += 1
      end
    end
  end

end

