# frozen_string_literal: true

# spec/factories/todos.rb

FactoryBot.define do
  factory :todo do
    title { 'Finish report' }
    association :user
  end
end
