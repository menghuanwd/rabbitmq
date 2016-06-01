require File.expand_path('../boot.rb', __FILE__)

# * 只允许一个
# # 0个，一个，多个
class Processor
  include Sneakers::Worker
  from_queue :topic3,
             exchange: 'logs_exchange',
             exchange_type: :topic,
             routing_key: 'error.*.now'

  def work(msg)
    puts "topic 3 #{msg}"

    ack!
  end
end

# sneakers work Processor --require sneakers/topic3.rb
