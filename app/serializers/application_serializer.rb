# frozen_string_literal: true

require 'routing'

class ApplicationSerializer
  class << self
    include Routing
  end
end
