# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :email, :created_at, :updated_at
end
