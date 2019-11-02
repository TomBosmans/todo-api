# frozen_string_literal: true

# module RedisHelper
#   extend ActiveSupport::Concern

#   included do
#     after { Redis.current.flushdb }
#   end
# end

# RSpec.configure do |config|
#   config.include RedisHelper
#   config.before(:suite) { Redis.current.select(1) } # select db 1
# end
