# frozen_string_literal: true
class Post < ApplicationRecord

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction  Non-Fiction] }

  validate :title_is_clickbaity


  def title_is_clickbaity
    if title == ("True Facts")
      errors.add(:title, "You are at a wrong title!")
    end
  end
end
