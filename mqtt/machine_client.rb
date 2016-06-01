# 机器客户端 发送数据
require 'mqtt'

client = MQTT::Client.new
client.host = '127.0.0.1'

# 建立连接
client.connect

# 长连接时间
puts client.keep_alive

# ping
puts client.ping

hash = { a: 1, b: 'a' }
# 发送数据
client.publish('machine-gu', hash)

# 断开连接
# client.disconnect
