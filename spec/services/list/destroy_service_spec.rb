# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List::DestroyService, type: :service do
  it 'destroys the list' do
    list = create :list
    list = described_class.execute(list)
    expect(list).to be_destroyed
  end

  it 'destroys the related todos' do
    list = create :list
    create_list :todo, 3, list: list
    described_class.execute(list)
    expect(Todo.count).to be_zero
  end

  it 'uses the todo destroy service' do
    list = create :list
    create_list :todo, 3, list: list
    allow(Todo::DestroyService).to receive(:execute).and_call_original
    described_class.execute(list)
    expect(Todo::DestroyService).to have_received(:execute).exactly(3).times
  end
end
