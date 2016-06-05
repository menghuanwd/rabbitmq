require 'bunny'

conn = Bunny.new(automatically_recover: false)
conn.start

channel = conn.create_channel

queue = channel.queue('rpc_queue')

exchange = channel.default_exchange

queue.subscribe(block: true) do |_delivery_info, properties, payload|
  p _delivery_info
  p properties
  p payload

  exchange.publish('i am response', routing_key: properties.reply_to)
end

sleep 1

puts 'over'
