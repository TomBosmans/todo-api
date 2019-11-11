# frozen_string_literal: true

class JsonApi::ToOneRelationshipsController < JsonApi::ApplicationController
  def update
    update_object(parent, "#{resource_key}_id" => resource_id)
    head :no_content
  end

  private

  def resource_id
    data[:id]
  end
end
