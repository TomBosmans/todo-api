# frozen_string_literal: true

module Routing
  extend ActiveSupport::Concern

  included do
    include Rails.application.routes.url_helpers

    def default_url_options
      ActionController::API.default_url_options
    end
  end
end
