# frozen_string_literal: true

# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class List < ApplicationRecord
  has_many :todos

  attribute :name, :string
  attribute :description, :string

  validates :name, presence: true
end
