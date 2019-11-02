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

require 'rails_helper'

RSpec.describe List, type: :model do
  subject { build :list }

  it { is_expected.to have_many :todos }
  it { is_expected.to validate_presence_of :name }
end
