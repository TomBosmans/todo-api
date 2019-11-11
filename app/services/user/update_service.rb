# frozen_string_literal: true

class User::UpdateService < ApplicationService
  def initialize(user, attributes:)
    @user = user
    @attributes = attributes
  end

  def execute
    user.update(attributes)
    user
  end

  private

  attr_reader :user, :attributes
end
