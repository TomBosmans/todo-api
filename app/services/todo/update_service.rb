# frozen_string_literal: true

class Todo::UpdateService < ApplicationService
  def initialize(todo, attributes:)
    @todo = todo
    @attributes = attributes
  end

  def execute
    todo.update(attributes)
    todo
  end

  private

  attr_reader :todo, :attributes
end
