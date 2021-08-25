class User < ApplicationRecord
  has_one_attached :image_name
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length:{in:6..20}, confirmation: true, allow_blank: true
  validates :password_confirmation, presence: true, allow_blank: true
  validates :image_name, presence: true
  validates :introduction, presence: true
end
