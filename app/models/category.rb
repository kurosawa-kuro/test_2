# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :categories_todos, dependent: :destroy
  has_many :todos, through: :categories_todos

  validates :title, presence: true

  def self.find_by_id(category_id)
    find(category_id)
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.debug e.message
    nil
  end
end
