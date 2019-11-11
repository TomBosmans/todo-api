# frozen_string_literal: true

require 'json_api'

module JsonApi::PaginationConcern
  def paginate(collection)
    return collection unless page_size && page_number

    JsonApi::Pagination.filter(collection,
                               size: page_size.to_i,
                               number: page_number.to_i)
  end

  def page_size
    params.dig(:page, :size)
  end

  def page_number
    params.dig(:page, :number)
  end
end
