# frozen_string_literal: true

require 'rails_helper'
require 'json_api/pagination'

RSpec.describe JsonApi::Pagination do
  context 'when using ActiveRecord::Relation' do
    it 'paginates with size 5 and number 1' do
      collection = create_list :user, 20
      paginated = described_class.filter(User.all, size: 5, number: 1)
      expect(paginated).to match_array(collection.first(5))
    end

    it 'paginates with size 6 and number 3' do
      collection = create_list :user, 20
      paginated = described_class.filter(User.all, size: 6, number: 3)
      expect(paginated).to match_array(collection.drop(12).first(6))
    end
  end

  context 'when using a normal Array' do
    it 'paginates with size 5 and number 1' do
      collection = Array.new(20) { { name: Faker::Name.name } }
      paginated = described_class.filter(collection, size: 5, number: 1)
      expect(paginated).to match_array(collection.first(5))
    end

    it 'paginates with size 6 and number 3' do
      collection = Array.new(20) { { name: Faker::Name.name } }
      paginated = described_class.filter(collection, size: 6, number: 3)
      expect(paginated).to match_array(collection.drop(12).first(6))
    end
  end
end
