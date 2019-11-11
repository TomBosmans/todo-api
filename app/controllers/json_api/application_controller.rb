# frozen_string_literal: true

class JsonApi::ApplicationController < ApplicationController
  include JsonApi::PaginationConcern
  include JsonApi::SortingConcern
  include JsonApi::ResourceHelper

  def data
    params.require(:data)
  end

  def attributes
    data.require(:attributes)
  end

  def serialize_object(data)
    serializer = "JsonApi::#{resource_model}Serializer".constantize
    serializer.new(data).serialized_json
  end
end
