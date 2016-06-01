# 电桩服务器订阅接受机器Topic
require 'mqtt'

client = MQTT::Client.new
client.host = '127.0.0.1'

# 建立连接
client.connect

# 发送数据
# client.subscribe('machine-gu')
client.subscribe('machine')

# 解析数据
client.get do |topic, message|
  puts "#{topic}  #{message}"
end

# 断开连接
# client.disconnect
