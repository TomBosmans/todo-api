# frozen_string_literal: true

class JsonApi::TodoSerializer < JsonApi::ApplicationSerializer
  attributes :name, :completed_at, :created_at, :updated_at

  belongs_to :list, links: {
    related: ->(todo) { json_api_todo_list_url(todo) },
    self: ->(todo) { json_api_todo_relationships_list_url(todo) }
  }

  link :self do |todo|
    json_api_todo_url(todo)
  end
end
