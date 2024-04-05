# frozen_string_literal: true

# app/services/category_todos_retrieval_service.rb
class CategoryTodosRetrievalService
  def initialize(user_id:)
    @user_id = user_id
  end

  def call
    user = User.find_by(id: @user_id)
    return nil if user.nil?

    user.todos.includes(:categories).map do |todo|
      {
        todo_id: todo.id,
        todo_title: todo.title,
        categories: map_categories(todo.categories)
      }
    end
  end

  private

  def map_categories(categories)
    categories.map do |category|
      {
        category_id: category.id,
        category_title: category.title
      }
    end
  end
end
