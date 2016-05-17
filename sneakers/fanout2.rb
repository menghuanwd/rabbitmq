require File.expand_path('../boot.rb', __FILE__)

class Processor
  include Sneakers::Worker
  from_queue :articles2,
              exchange: 'i_am_fanout',
              exchange_type: :fanout

  def work(msg)
    puts "work 2 #{msg}"

    ack!
  end
end