# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  # Todoインスタンスが有効であることを確認
  it 'is valid with a user and title' do
    user = User.create(email: 'test@example.com')
    todo = Todo.new(user:, title: 'Test Todo')
    expect(todo).to be_valid
  end

  # titleがない場合に無効であることを確認
  it 'is invalid without a title' do
    todo = Todo.new(title: nil)
    todo.valid?
    expect(todo.errors[:title]).to include("can't be blank")
  end
end
