# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List::CreateService, type: :service do
  context 'when attributes are valid' do
    it 'returns a persisted list' do
      attributes = attributes_for :list
      list = described_class.execute(attributes: attributes)
      expect(list).to be_persisted
    end
  end

  context 'when attributes are not valid' do
    it 'returns a non persisted list' do
      attributes = attributes_for :list, name: nil
      list = described_class.execute(attributes: attributes)
      expect(list).not_to be_persisted
    end

    it 'returns a list with errors' do
      attributes = attributes_for :list, name: nil
      list = described_class.execute(attributes: attributes)
      expect(list.errors).to be_present
    end
  end
end
