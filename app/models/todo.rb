# frozen_string_literal: true

class Todo < ApplicationRecord
  belongs_to :user
  has_many :categories_todos, dependent: :destroy
  has_many :categories, through: :categories_todos

  validates :title, presence: true

  def self.create_with_category(user, title, category)
    todo = user.todos.create!(title:)
    CategoriesTodo.create!(todo:, category:)
    todo
  end
end
