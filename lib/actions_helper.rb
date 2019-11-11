# frozen_string_literal: true

module ActionsHelper
  def create_object(resource, attributes)
    create_service = "#{resource.model_name.name}::CreateService".constantize
    create_service.execute(resource, attributes: attributes)
  end

  def update_object(resource, attributes)
    update_service = "#{resource.model_name.name}::UpdateService".constantize
    update_service.execute(resource, attributes: attributes)
  end

  def destroy_object(resource)
    destroy_service = "#{resource.model_name.name}::DestroyService".constantize
    destroy_service.execute(resource)
  end
end
