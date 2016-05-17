require File.expand_path('../boot.rb', __FILE__)

class Processor
  include Sneakers::Worker
  from_queue :information_id,
              exchange: 'i_am_direct',
              exchange_type: :direct

  def work(msg)
    puts msg

    ack!
  end
end