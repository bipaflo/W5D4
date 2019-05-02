class User < ApplicationRecord
  has_secure_password

  validates :first_name,
    presence: true
  validates :last_name,
    presence: true
  validates :description,
    presence: true,
    length: { in: 1..140 }
  validates :email,
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :password,
    presence: true,
    length: { in: 6..30, message: "password incorrect"}
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes, dependent: :destroy
  
  def full_name
    first_name + " " + last_name
  end
end
