# 电桩服务器订阅接受机器Topic
require 'mqtt'

client = MQTT::Client.new
client.host = '127.0.0.1'

# 建立连接
client.connect

# 订阅数据
client.subscribe('machine-gu')

client.get do |topic, message|
  p "#{topic}  #{message} #{message.class} #{message['a']}"
  p message
  p Hash[message][:a]
  p Hash[message][:b]

  # sleep 10
  if message == 'open lock'
    client.publish('machine-response', 'has opened lock')
  end
end

# 断开连接
# client.disconnect
