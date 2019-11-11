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

class User < ApplicationRecord
  has_secure_password

  attribute :password, :string
  attribute :password_confirmation, :string

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, confirmation: true, on: :create
end
