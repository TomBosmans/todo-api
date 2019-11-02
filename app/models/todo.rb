# frozen_string_literal: true

# == Schema Information
#
# Table name: todos
#
#  id           :integer          not null, primary key
#  list_id      :integer
#  name         :string           not null
#  completed_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_todos_on_list_id  (list_id)
#

class Todo < ApplicationRecord
  belongs_to :list

  attribute :name, :string
  attribute :completed_at, :datetime

  validates :name, presence: true

  def completed?
    completed_at.present?
  end
end
