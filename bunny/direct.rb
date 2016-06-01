require 'bunny'

conn = Bunny.new
conn.start

channel = conn.create_channel

queue = channel.queue('information_id', durable: true)

exchange = channel.default_exchange

# 订阅当前Queue
# queue.subscribe do |delivery_info, metadata, payload|
#   p delivery_info
#   p metadata
#   p payload
# end

exchange.publish('Hello, everybody!', routing_key: queue.name)

exchange.publish('Hello, everybody2!', routing_key: queue.name)

sleep 2

conn.stop

# 只关心Queue
# 路由键匹配就被投递到相应的队列
# 默认交换机
# 以队列名称作为路由键
