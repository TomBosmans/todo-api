# frozen_string_literal: true

class JsonApi::ApplicationSerializer < ApplicationSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :underscore
end
