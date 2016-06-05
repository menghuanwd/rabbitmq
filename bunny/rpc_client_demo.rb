require 'bunny'

lock      = Mutex.new
resource = ConditionVariable.new

conn = Bunny.new(automatically_recover: false)
conn.start

channel = conn.create_channel

queue = channel.queue('rpc_queue')

reply_queue = channel.queue('', exclusive: true)

exchange = channel.default_exchange

reply_queue.subscribe do |_delivery_info, properties, payload|
  p _delivery_info
  p properties
  puts 'over1'
  p payload
  puts 'over2'

  lock.synchronize { resource.signal }
end

p queue.name

exchange.publish('test', routing_key: queue.name, correlation_id: "#{rand}#{rand}#{rand}", reply_to: reply_queue.name)

lock.synchronize { resource.wait(lock) }
