# frozen_string_literal: true

class User::CreateService < ApplicationService
  def initialize(user = User.new, attributes:)
    @user = user
    @attributes = attributes
  end

  def execute
    user.assign_attributes(attributes)
    user.save
    user
  end

  private

  attr_reader :user, :attributes
end
