# frozen_string_literal: true

class TodoSerializer < ApplicationSerializer
  attributes :name, :completed?, :completed_at, :created_at, :updated_at
  belongs_to :list
end
