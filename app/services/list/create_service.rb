# frozen_string_literal: true

class List::CreateService < ApplicationService
  def initialize(list = List.new, attributes:)
    @list = list
    @attributes = attributes
  end

  def execute
    list.assign_attributes(attributes)
    list.save
    list
  end

  private

  attr_reader :list, :attributes
end
