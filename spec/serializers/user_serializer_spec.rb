# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  it 'is correctly structured' do
    user = create(:user)
    serializer = described_class.new user
    expect(serializer.serializable_hash).to(
      include(
        data: {
          id: user.id.to_s,
          type: :user,
          attributes: {
            email: user.email,
            created_at: user.created_at,
            updated_at: user.updated_at
          }
        }
      )
    )
  end
end
