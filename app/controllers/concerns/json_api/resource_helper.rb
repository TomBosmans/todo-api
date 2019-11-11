# frozen_string_literal: true

module JsonApi::ResourceHelper
  def modules
    self.class.name.sub('JsonApi::', '').chomp('Controller').split('::')
  end

  def nested?
    modules.many?
  end

  def resource_name
    modules.last.singularize.downcase
  end

  def resource_model
    resource_name.camelcase.constantize
  end

  def resource_key
    resource_key = resource_name
    resource_key = resource_key.pluralize if many_relationship?
    resource_key
  end

  def many_relationship?
    parent.try(resource_name).blank?
  end

  def parent_name
    modules.first.singularize.downcase
  end

  def parent_model
    parent_name.camelcase.constantize
  end

  def parent_key
    "#{parent_name}_id"
  end

  def parent
    @parent ||= parent_model.find(parent_id)
  end

  def parent_id
    params[parent_key]
  end
end
