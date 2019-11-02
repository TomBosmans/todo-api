# frozen_string_literal: true

Redis.current = Redis.new(host: ENV['REDIS_HOST'] || 'localhost')
