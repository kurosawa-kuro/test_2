# frozen_string_literal: true

class CategoriesTodo < ApplicationRecord
  belongs_to :todo
  belongs_to :category
end
