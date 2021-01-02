class Help < ApplicationRecord
  # belongs_to :user

  validates :title, presence: true, length: {minimum: 6}
  validates :description, presence: true, length: {minimum: 20}
  validates :location, presence: true, format: {with: /\A[0-9]+\.[0-9]{1,2},\s*[0-9]+\.[0-9]{1,2}\Z/}
  validates :category_id, presence: true, format: {with: /\A[1-9]+\Z/}
  validates :user_id, presence: true, format: {with: /\A[1-9]+\Z/}
end