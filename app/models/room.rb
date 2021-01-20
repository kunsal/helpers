class Room < ApplicationRecord
  has_many :messages
  has_many :users
  belongs_to :help
end
