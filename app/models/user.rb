class User < ApplicationRecord
  has_secure_password
  after_initialize :hide_columns

  def hide_columns
    [:password].each do |c|
      send("#{c}=", send(c))
      send("#{c}=", nil)
    end
  end
  has_many :helps, dependent: :destroy

  validates :first_name, presence: true, length: {minimum: 2}
  validates :last_name, presence: true, length: {minimum: 2}
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}
  validates :government_id, presence: true
end
