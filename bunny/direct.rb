require "bunny"

conn = Bunny.new
conn.start

channel = conn.create_channel

queue  = channel.queue('information_id', durable: true)

queue.publish("Hello, everybody!")

delivery_info, metadata, payload = queue.pop

puts "This is the message: #{payload}"

conn.stop