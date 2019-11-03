# frozen_string_literal: true

require 'json_api'

module Pagination
  def paginate(collection)
    return collection unless page_size && page_number

    JsonApi::Pagination.filter(collection,
                               size: page_size,
                               number: page_number)
  end

  def page_size
    params.dig(:page, :size)
  end

  def page_number
    params.dig(:page, :number)
  end
end
