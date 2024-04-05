# frozen_string_literal: true

class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
