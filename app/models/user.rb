# frozen_string_literal: true

class User < ApplicationRecord
  has_many :todos, dependent: :destroy

  def self.find_by_id(user_id)
    find(user_id)
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.debug e.message
    nil
  end
end
