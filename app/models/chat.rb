class Chat < ApplicationRecord
  belongs_to :help
  belongs_to :user

  validates :message, presence: true
end
