require File.expand_path('../boot.rb', __FILE__)

class Processor
  include Sneakers::Worker

  from_queue :information_id

  def work(msg)
    puts msg

    ack!
  end
end

# sneakers work Processor --require sneakers/direct.rb
