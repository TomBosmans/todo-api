# frozen_string_literal: true

module ResponseHelper
  extend ActiveSupport::Concern

  included do
    def body
      JSON.parse(response.body)
    end

    let(:data) { body['data'] }
    let(:error_detail) { body['detail'] }
    let(:attributes) { body.dig('data', 'attributes') }
  end
end

RSpec.configure do |config|
  config.include ResponseHelper, type: :controller
end
