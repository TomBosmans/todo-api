# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User::UpdateService, type: :service do
  context 'when attributes are valid' do
    it 'returns an updated user' do
      user = create :user
      attributes = { email: 'new@email.com' }
      user = described_class.execute(user, attributes: attributes)
      expect(user).to have_attributes(email: 'new@email.com')
    end

    it 'persists the changes' do
      user = create :user
      attributes = { email: 'new@email.com' }
      described_class.execute(user, attributes: attributes)
      expect(user.reload).to have_attributes(email: 'new@email.com')
    end
  end

  context 'when attributes are not valid' do
    it 'returns a user with errors' do
      user = create :user
      attributes = { email: nil }
      user = described_class.execute(user, attributes: attributes)
      expect(user.errors).to be_present
    end

    it 'does not persist the changes' do
      user = create :user
      attributes = { email: nil }
      described_class.execute(user, attributes: attributes)
      expect(user.reload).not_to have_attributes(email: nil)
    end
  end
end
