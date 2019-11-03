# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodoSerializer, type: :serializer do
  it 'is correctly structured' do
    todo = create :todo
    serializer = described_class.new todo
    expect(serializer.serializable_hash).to(
      include(
        data: {
          id: todo.id.to_s,
          type: :todo,
          attributes: {
            name: todo.name,
            'completed?': todo.completed?,
            completed_at: todo.completed_at,
            created_at: todo.created_at,
            updated_at: todo.updated_at
          },
          relationships: {
            list: {
              data: { id: todo.list.id.to_s, type: :list }
            }
          }
        }
      )
    )
  end
end
