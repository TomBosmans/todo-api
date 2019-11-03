# frozen_string_literal: true

require 'spec_helper'
require 'json_api/sort_fields'

RSpec.describe JsonApi::SortFields do
  it 'deserializes given string of fields' do
    fields = described_class.deserialize('first_name,last_name,-email,description,-start_date')
    expect(fields).to include(first_name: :asc, last_name: :asc, email: :desc,
                              description: :asc, start_date: :desc)
  end
end
