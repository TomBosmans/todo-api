# frozen_string_literal: true

class JsonApi::UsersController < JsonApi::ResourcesController
  private

  def resource_params
    attributes.permit(:email, :password, :password_confirmation)
  end
end
