# frozen_string_literal: true

class JsonApi::UserSerializer < JsonApi::ApplicationSerializer
  attributes :email, :created_at, :updated_at

  link :self do |user|
    json_api_user_url(user)
  end
end
