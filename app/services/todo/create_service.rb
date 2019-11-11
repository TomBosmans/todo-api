# frozen_string_literal: true

class Todo::CreateService < ApplicationService
  def initialize(todo = Todo.new, attributes:)
    @todo = todo
    @attributes = attributes
  end

  def execute
    todo.assign_attributes(attributes)
    todo.save
    todo
  end

  private

  attr_reader :todo, :attributes
end
