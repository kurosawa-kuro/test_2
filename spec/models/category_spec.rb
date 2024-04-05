# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  # Categoryインスタンスが有効であることを確認
  it 'is valid with a title' do
    category = Category.new(title: 'Test Category')
    expect(category).to be_valid
  end

  # titleがない場合に無効であることを確認
  it 'is invalid without a title' do
    category = Category.new(title: nil)
    category.valid?
    expect(category.errors[:title]).to include("can't be blank")
  end
end
