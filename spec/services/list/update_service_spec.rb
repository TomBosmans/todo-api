# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List::UpdateService, type: :service do
  context 'when attributes are valid' do
    it 'returns an updated list' do
      list = create :list
      attributes = { name: 'new name' }
      list = described_class.execute(list, attributes: attributes)
      expect(list).to have_attributes(name: 'new name')
    end

    it 'persists the changes' do
      list = create :list
      attributes = { name: 'new name' }
      described_class.execute(list, attributes: attributes)
      expect(list.reload).to have_attributes(name: 'new name')
    end
  end

  context 'when attributes are not valid' do
    it 'returns a list with errors' do
      list = create :list
      attributes = { name: nil }
      list = described_class.execute(list, attributes: attributes)
      expect(list.errors).to be_present
    end

    it 'does not persist the changes' do
      list = create :list
      attributes = { name: nil }
      described_class.execute(list, attributes: attributes)
      expect(list.reload).not_to have_attributes(name: nil)
    end
  end
end
