require 'bunny'

{
  :host      => "127.0.0.1",
  :port      => 5672,
  :ssl       => false,
  :vhost     => "/",
  :user      => "guest",
  :password      => "guest",
  :heartbeat => :server, # will use RabbitMQ setting
  :frame_max => 131072,
  :auth_mechanism => "PLAIN"
}

conn = Bunny.new(vhost: 'machine')
# conn = Bunny.new(:host => "localhost", :vhost => "myapp.production", :user => "bunny", :password => "t0ps3kret")
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
