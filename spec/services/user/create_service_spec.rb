# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User::CreateService, type: :service do
  context 'when attributes are valid' do
    it 'returns a persisted user' do
      attributes = attributes_for :user
      user = described_class.execute(attributes: attributes)
      expect(user).to be_persisted
    end
  end

  context 'when attributes are not valid' do
    it 'returns a non persisted user' do
      attributes = attributes_for :user, email: nil
      user = described_class.execute(attributes: attributes)
      expect(user).not_to be_persisted
    end

    it 'returns a user with errors' do
      attributes = attributes_for :user, email: nil
      user = described_class.execute(attributes: attributes)
      expect(user.errors).to be_present
    end
  end
end
