# frozen_string_literal: true

class JsonApi::ResourcesController < JsonApi::ApplicationController
  def index
    resources = sort find_resources
    resources = paginate resources
    render json: serialize_object(resources), status: :ok
  end

  def show
    resource = find_resource
    render json: serialize_object(resource), status: :ok
  end

  def create
    resource = create_object(new_resource, resource_params)
    if resource.errors.blank?
      render json: serialize_object(resource), status: :created
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  def update
    resource = update_object(find_resource, resource_params)
    if resource.errors.blank?
      head :no_content
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  def destroy
    resource = find_resource
    destroy_object(resource)
    head :no_content
  end

  private

  def find_resource
    return find_resources.find(params[:id]) unless nested?
    return parent.send(resource_name) unless many_relationship?

    find_resources.find(params[:id])
  end

  def find_resources
    return parent.send(resource_key) if nested?

    resource_model.all
  end

  def new_resource
    return parent.send(resource_key).new if nested?

    resource_model.new
  end
end
