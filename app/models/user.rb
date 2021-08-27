class User < ApplicationRecord
  has_many :rooms
  has_one_attached :image_name
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length:{in:6..20}, confirmation: true, allow_blank: true
  validates :password_confirmation, presence: true, allow_blank: true
  validates :image_name, presence: true, unless: -> { validation_context == :create }
  validates :introduction, presence: true, unless: -> { validation_context == :create }
end
