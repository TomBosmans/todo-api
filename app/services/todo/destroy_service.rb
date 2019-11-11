# frozen_string_literal: true

class Todo::DestroyService < ApplicationService
  def initialize(todo)
    @todo = todo
  end

  def execute
    todo.destroy
  end

  private

  attr_reader :todo
end
