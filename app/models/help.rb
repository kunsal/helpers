class Help < ApplicationRecord
  belongs_to :user  
  belongs_to :category
  has_many :chats

  scope :active, -> { where("fulfilment_count < 5") }

  after_save :mark_as_fulfilled

  validates :title, presence: true, length: {minimum: 6}
  validates :description, presence: true, length: {minimum: 20}
  validates :location, presence: true, format: {with: /\A[0-9]+\.[0-9]+,\s*[0-9]+\.[0-9]+\Z/}
  # validates :category_id, presence: true, format: {with: /\A[1-9]+\Z/}
  # validates :user_id, presence: true, format: {with: /\A[1-9]+\Z/}
  private
    def mark_as_fulfilled
      if ((self.fulfilment_count == 5) && (self.status == false))
        self.status = true
        if self.save
          StatusChannel.broadcast_to self, {status: true}
        end
      end
    end
end