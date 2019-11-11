# frozen_string_literal: true

class User::DestroyService < ApplicationService
  def initialize(user)
    @user = user
  end

  def execute
    user.destroy
    user
  end

  private

  attr_reader :user
end
