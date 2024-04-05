# app/services/create_todo_and_associate_with_category_service.rb
# frozen_string_literal: true

class TodoCreationService
  def initialize(user_id:, todo_title:, category_id:)
    @user_id = user_id
    @todo_title = todo_title
    @category_id = category_id
  end

  def call
    user = User.find_by(id: @user_id)
    category = Category.find_by(id: @category_id)
    return nil if user.nil? || category.nil?

    create_todo(user, category)
  end

  private

  def create_todo(user, category)
    Todo.create_with_category(user, @todo_title, category)
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error "Failed to create todo: #{e.message}"
    nil
  end
end
