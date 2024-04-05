# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryTodosRetrievalService do
  describe '#call' do
    let(:user) { create(:user, email: 'test@example.com') }
    let(:category) { create(:category, title: 'Work') }
    let!(:todo) { create(:todo, title: 'Finish report', user:) }
    let!(:categories_todo) { create(:categories_todo, todo:, category:) }

    let(:params) { { user_id: user.id } }
    let(:invalid_params) { { user_id: -1 } }
    let(:expected_result) do
      contain_exactly(
        a_hash_including(
          todo_id: todo.id,
          todo_title: 'Finish report',
          categories: contain_exactly(
            a_hash_including(category_id: category.id, category_title: 'Work')
          )
        )
      )
    end
  end
end
