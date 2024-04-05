# frozen_string_literal: true

class CreateCategoriesTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :categories_todos do |t|
      t.references :todo, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
