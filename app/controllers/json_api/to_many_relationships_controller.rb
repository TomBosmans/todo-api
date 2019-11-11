# frozen_string_literal: true

class JsonApi::ToManyRelationshipsController < JsonApi::ApplicationController
  def create
    resource_model.where(id: resource_ids).each do |resource|
      update_object(resource, parent_key => parent.id)
    end

    head :no_content
  end

  def update
    resources = resource_model.where(id: resource_ids)
    update_object(parent, resource_key => resources)
    head :no_content
  end

  def destroy
    parent.send(resource_key).where(id: resource_ids).each do |resource|
      update_object(resource, parent_key => nil)
    end

    head :no_content
  end

  private

  def resource_ids
    data.map { |resource| resource[:id] }
  end
end
