class Help < ApplicationRecord
  belongs_to :user  
  belongs_to :category
  has_many :chats

  validates :title, presence: true, length: {minimum: 6}
  validates :description, presence: true, length: {minimum: 20}
  validates :location, presence: true, format: {with: /\A[0-9]+\.[0-9]+,\s*[0-9]+\.[0-9]+\Z/}
  # validates :category_id, presence: true, format: {with: /\A[1-9]+\Z/}
  # validates :user_id, presence: true, format: {with: /\A[1-9]+\Z/}
end