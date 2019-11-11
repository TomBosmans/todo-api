# frozen_string_literal: true

class JsonApi::ListSerializer < JsonApi::ApplicationSerializer
  attributes :name, :description, :created_at, :updated_at

  has_many :todos, links: {
    related: ->(list) { json_api_list_todos_url(list) },
    self: ->(list) { json_api_list_relationships_todos_url(list) }
  }

  link :self do |list|
    json_api_list_url(list)
  end
end
