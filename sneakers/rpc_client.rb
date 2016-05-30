require File.expand_path('../boot.rb', __FILE__)

require 'sneakers_packer'

require 'SecureRandom'

SneakersPacker.configure do |conf|
  conf.rpc_timeout = 5             # rpc client timeout. default is 5 seconds.
  conf.app_name = "sneakers_test"  # rpc client or server app's name. default is 'unknown'
end

# SneakersPacker.publish("demo", "hello world")
hash = {c: 1, d:1}
message = SneakersPacker.remote_call("rpc_server", hash)

puts message.class
puts message
puts message[:a]
puts message['a']