# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to have_secure_password }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.not_to allow_value(*invalid_emails).for :email }
  it { is_expected.to allow_value(*valid_emails).for :email }
  it { is_expected.to validate_confirmation_of(:password).on(:create) }
end
