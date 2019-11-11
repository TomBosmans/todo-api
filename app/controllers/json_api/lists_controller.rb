# frozen_string_literal: true

class JsonApi::ListsController < JsonApi::ResourcesController
  private

  def resource_params
    attributes.permit(:name, :description)
  end
end
