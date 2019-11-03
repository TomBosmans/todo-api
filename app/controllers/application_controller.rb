# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagination
  include Sorting

  def self.resource_name
    name.split('::').last.chomp('Controller').singularize
  end

  def resource_name
    self.class.resource_name
  end

  def serializer
    "#{resource_name}Serializer".constantize
  end

  def serialize(data)
    serializer.new(data).serialized_json
  end
end
