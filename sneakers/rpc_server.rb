require File.expand_path('../boot.rb', __FILE__)

require 'sneakers_packer'

class RpcServerWorker
  include SneakersPacker::RpcWorker

  from_queue :rpc_server

  # return value of call will be result of remote procedure call
  def call(data)
    # a =Time.now
    puts data
    # puts data.as_json
    puts data.class
    puts data['c']
    puts data[:c]

    # data.to_i ** 3
    # sleep 4
    'ok'
    # puts Time.now - a
    { a: 1, b: 2 }
  end
end
