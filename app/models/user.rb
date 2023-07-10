class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :icon_image_name
  validates :email, {presence: true, uniqueness: true}
  validates :name, presence: true
  has_one_attached :icon_image_name
  has_many :room
end
