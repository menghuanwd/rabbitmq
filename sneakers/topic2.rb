require File.expand_path('../boot.rb', __FILE__)

class Processor
  include Sneakers::Worker
  from_queue :topic2,
              exchange: 'logs_exchange',
              exchange_type: :topic,
              routing_key: 'info.*'

  def work(msg)
    puts "topic 2 #{msg}"

    ack!
  end
end

# sneakers work Processor --require sneakers/topic2.rb
