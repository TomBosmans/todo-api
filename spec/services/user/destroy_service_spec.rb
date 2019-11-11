# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User::DestroyService, type: :service do
  it 'destroys the user' do
    user = create :user
    user = described_class.execute(user)
    expect(user).to be_destroyed
  end
end
