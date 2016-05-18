# 电桩服务器订阅接受机器Topic
require 'mqtt'

client = MQTT::Client.new
client.host = '127.0.0.1'

# 建立连接
client.connect

client.ping

client.generate_client_id

client.subscribe('machine-response')

# 发布数据
client.publish('machine-gu', 'open lock')

# 订阅接受数据
client.get

client.disconnect
