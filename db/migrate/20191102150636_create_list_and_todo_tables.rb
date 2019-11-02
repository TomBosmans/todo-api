# frozen_string_literal: true

class CreateListAndTodoTables < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end

    create_table :todos do |t|
      t.references :list, index: true, foreign_key: true
      t.string :name, null: false
      t.datetime :completed_at, precision: 6, null: true

      t.timestamps
    end
  end
end
