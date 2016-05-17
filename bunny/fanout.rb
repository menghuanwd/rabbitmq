require "bunny"

conn = Bunny.new
conn.start

channel = conn.create_channel

payload = "Hello, Fanout!"

channel.fanout("i_am_fanout", durable: true).publish(payload)

puts "This is the message: #{payload}"

conn.stop