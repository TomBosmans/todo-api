# frozen_string_literal: true

require 'json_api'

module JsonApi::SortingConcern
  def sort(collection)
    return collection unless params[:sort]

    collection.order(sort_fields)
  end

  def sort_fields
    @sort_fields ||= JsonApi::SortFields.deserialize(params[:sort])
  end
end
