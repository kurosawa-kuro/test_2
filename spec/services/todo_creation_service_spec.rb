# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodoCreationService do
  describe '#call' do
    let(:user) { create(:user) }
    let(:category) { create(:category, title: 'Category 1') }
    let(:todo_title) { 'New Todo' }
    let(:params) { { user_id: user.id, todo_title:, category_id: category.id } }
    let(:invalid_params) { { user_id: -1, todo_title:, category_id: category.id } }
    let(:expected_result) do
      a_hash_including(
        success?: true,
        todo: an_instance_of(Todo),
        error_message: nil
      )
    end

    context 'when valid parameters are provided' do
      it 'creates a new Todo associated with the user and category' do
        expect { described_class.new(**params).call }
          .to change { Todo.count }.by(1)
          .and change { CategoriesTodo.count }.by(1)

        todo = Todo.last
        expect(todo.title).to eq(todo_title)
        expect(todo.user).to eq(user)
        expect(todo.categories).to include(category)
      end
    end
  end
end
