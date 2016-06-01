# 用来上传图片

require File.expand_path('../boot.rb', __FILE__)

class Processor
  include Sneakers::Worker
  from_queue :upload_pictures,
             exchange: 'user_operate',
             exchange_type: :fanout

  def work(msg)
    puts "upload_pictures has finished"

    ack!
  end
end

# 以队列名称作为路由键

# sneakers work Processor --require sneakers/fanout2.rb
