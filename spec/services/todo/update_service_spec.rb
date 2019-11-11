# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo::UpdateService, type: :service do
  context 'when attributes are valid' do
    it 'returns an updated todo' do
      todo = create :todo
      attributes = { name: 'new name' }
      todo = described_class.execute(todo, attributes: attributes)
      expect(todo).to have_attributes(name: 'new name')
    end

    it 'persists the changes' do
      todo = create :todo
      attributes = { name: 'new name' }
      described_class.execute(todo, attributes: attributes)
      expect(todo.reload).to have_attributes(name: 'new name')
    end
  end

  context 'when attributes are not valid' do
    it 'returns a todo with errors' do
      todo = create :todo
      attributes = { name: nil }
      todo = described_class.execute(todo, attributes: attributes)
      expect(todo.errors).to be_present
    end

    it 'does not persist the changes' do
      todo = create :todo
      attributes = { name: nil }
      described_class.execute(todo, attributes: attributes)
      expect(todo.reload).not_to have_attributes(name: nil)
    end
  end
end
