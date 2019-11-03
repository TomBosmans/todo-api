# frozen_string_literal: true

class ListSerializer < ApplicationSerializer
  attributes :name, :description, :created_at, :updated_at
  has_many :todos
end
