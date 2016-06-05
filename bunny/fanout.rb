require 'bunny'

conn = Bunny.new
# conn = Bunny.new(vhost: 'machine', user: 'linjian', password: 'password')
conn.start

channel = conn.create_channel

payload = 'Hello, Fanout!'

exchange = channel.fanout('user_operate', durable: true)

exchange.publish(payload)

conn.stop

# one - many
# 不声明Queue
# 发送到附加到这个交换机的队列上
# 可以对一个数据源进行多种不一样的操作
# 以队列名称作为路由键
