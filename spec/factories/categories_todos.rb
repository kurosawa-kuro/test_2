# frozen_string_literal: true

# spec/factories/categories_todos.rb

FactoryBot.define do
  factory :categories_todo do
    association :category
    association :todo
  end
end
