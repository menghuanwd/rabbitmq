require "bunny"

conn = Bunny.new
conn.start

channel = conn.create_channel

payload = "Hello, Guyifeng!"

exchange = channel.topic("i_am_topic", durable: true)

exchange.publish(payload, :routing_key => "topic.linda.books")

conn.stop