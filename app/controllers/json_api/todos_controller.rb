# frozen_string_literal: true

class JsonApi::TodosController < JsonApi::ResourcesController
  private

  def resource_params
    attributes.permit(:name, :completed_at, :list_id)
  end
end
