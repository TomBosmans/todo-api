# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo::DestroyService, type: :service do
  it 'destroys the todo' do
    todo = create :todo
    todo = described_class.execute(todo)
    expect(todo).to be_destroyed
  end
end
