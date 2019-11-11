# frozen_string_literal: true

class List::UpdateService < ApplicationService
  def initialize(list, attributes:)
    @list = list
    @attributes = attributes
  end

  def execute
    list.update(attributes)
    list
  end

  private

  attr_reader :list, :attributes
end
