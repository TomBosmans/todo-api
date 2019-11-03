# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListSerializer, type: :serializer do
  it 'is correctly structured' do
    list = create :list
    create_list :todo, 4, list: list
    serializer = described_class.new(list)
    expect(serializer.serializable_hash).to(
      include(
        data: {
          id: list.id.to_s,
          type: :list,
          attributes: {
            name: list.name,
            description: list.description,
            created_at: list.created_at,
            updated_at: list.updated_at
          },
          relationships: {
            todos: {
              data: list.todos.map do |todo|
                { id: todo.id.to_s, type: :todo }
              end
            }
          }
        }
      )
    )
  end
end
