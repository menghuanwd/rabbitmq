# 用来清除缓存

require File.expand_path('../boot.rb', __FILE__)

class Processor
  include Sneakers::Worker
  from_queue :clean_cache,
             exchange: 'user_operate',
             exchange_type: :fanout

  def work(msg)
    puts "clean cache has finished"

    ack!
  end
end

# 以队列名称作为路由键

# sneakers work Processor --require sneakers/fanout1.rb
