class Gossip < ApplicationRecord
  validates :title,
    presence: true,
    length: { in: 3..40 }
  validates :content,
    presence: true,
    length: { in: 1..140 }
  validates :user_id,
    presence: true
  belongs_to :user
  has_many :comments
  has_many :likes
end
