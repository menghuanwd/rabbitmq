require 'bunny'

conn = Bunny.new
conn.start

channel = conn.create_channel

exchange = channel.topic('logs_exchange', durable: true)

# payload = 'I find a error elasticsearch bug!'
# exchange.publish(payload, routing_key: 'error.elasticsearch')
#
# payload = 'I find a error mongodb bug!'
# exchange.publish(payload, routing_key: 'error.mongodb')
#
# payload = 'I find a error mongodb bug now!'
# exchange.publish(payload, routing_key: 'error.mongodb.now')
#
# payload = 'I find a info elasticsearch bug!'
# exchange.publish(payload, routing_key: 'info.elasticsearch')
#
# payload = 'I find a info mongodb bug!'
# exchange.publish(payload, routing_key: 'info.mongodb')

payload = 'elasticsearch mongodb!'
exchange.publish(payload, routing_key: 'elasticsearch.mongodb', persistent: true)

conn.stop
