# frozen_string_literal: true

require 'actions_helper'

class ApplicationService
  include ActionsHelper

  def self.execute(*args, &block)
    new(*args).execute(&block)
  end
end
