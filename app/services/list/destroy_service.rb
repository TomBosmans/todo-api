# frozen_string_literal: true

class List::DestroyService < ApplicationService
  def initialize(list)
    @list = list
  end

  def execute
    list.todos.each { |todo| destroy_object(todo) }
    list.destroy
  end

  private

  attr_reader :list
end
