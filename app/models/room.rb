class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :room_image
  
  validates :room_name, presence: true
  validates :room_introduction, presence: true
  validates :price, presence: true
  validates :adress, presence: true
  validates :room_image, presence: { message: "を選択してください。" }
end
