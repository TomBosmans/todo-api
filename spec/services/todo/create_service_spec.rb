# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo::CreateService, type: :service do
  context 'when attributes are valid' do
    it 'returns a persisted todo' do
      attributes = attributes_for :todo, list_id: create(:list).id
      todo = described_class.execute(attributes: attributes)
      expect(todo).to be_persisted
    end
  end

  context 'when attributes are not valid' do
    it 'returns a non persisted todo' do
      attributes = attributes_for :todo, name: nil
      todo = described_class.execute(attributes: attributes)
      expect(todo).not_to be_persisted
    end

    it 'returns a todo with errors' do
      attributes = attributes_for :todo, name: nil
      todo = described_class.execute(attributes: attributes)
      expect(todo.errors).to be_present
    end
  end
end
