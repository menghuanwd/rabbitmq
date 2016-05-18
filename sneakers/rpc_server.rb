require File.expand_path('../boot.rb', __FILE__)

require 'sneakers_packer'

class RpcServerWorker
  include SneakersPacker::RpcWorker

  from_queue :rpc_server

  # return value of call will be result of remote procedure call
  def call(data)
    puts data
    data.to_i ** 3
    sleep 4
    'ok'
  end
end