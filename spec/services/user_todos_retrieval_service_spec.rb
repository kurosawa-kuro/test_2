# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserTodosRetrievalService do # rubocop:disable Metrics/BlockLength
  describe '#call' do # rubocop:disable Metrics/BlockLength
    let(:user) { create(:user, email: 'user@example.com') }
    let(:category) { create(:category, title: 'Work') }

    before do
      create(:todo, title: 'Finish report', user:, categories: [category])
      create(:todo, title: 'Attend meeting', user:, categories: [category])
      create(:todo, title: 'Buy groceries', user:)
    end

    let(:params) { { user_id: user.id } }
    let(:invalid_params) { { user_id: -1 } }
    let(:expected_result) do
      contain_exactly(
        a_hash_including(
          todo_id: an_instance_of(Integer),
          todo_title: 'Finish report',
          categories: contain_exactly(
            a_hash_including(category_id: category.id, category_title: 'Work')
          )
        ),
        a_hash_including(
          todo_id: an_instance_of(Integer),
          todo_title: 'Attend meeting',
          categories: contain_exactly(
            a_hash_including(category_id: category.id, category_title: 'Work')
          )
        ),
        a_hash_including(
          todo_id: an_instance_of(Integer),
          todo_title: 'Buy groceries',
          categories: be_empty
        )
      )
    end
  end
end
