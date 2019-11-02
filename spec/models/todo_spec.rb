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

require 'rails_helper'

RSpec.describe Todo, type: :model do
  subject { build :todo }

  it { is_expected.to belong_to :list }
  it { is_expected.to validate_presence_of :name }

  describe '#completed?' do
    it 'is completed when #completed_at is filled in' do
      todo = build(:todo, completed_at: Time.current)
      expect(todo).to be_completed
    end

    it 'is not completed when #completed_at is empty' do
      todo = build(:todo, completed_at: nil)
      expect(todo).not_to be_completed
    end
  end
end
