# frozen_string_literal: true

class UserTodosRetrievalService
  def initialize(category_id:)
    @category_id = category_id
  end

  def call
    category = find_category
    todos = find_associated_todos(category)
    {
      category_id: category.id,
      category_title: category.title,
      todos: todos.map { |todo| { todo_id: todo.id, todo_title: todo.title } }
    }
  end

  private

  def find_category
    Category.find(@category_id)
  end

  def find_associated_todos(category)
    category.todos
  end
end
