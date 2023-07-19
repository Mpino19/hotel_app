class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :room_image
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def self.search_area(area)
    where(["address like?", "%#{area}%"])
  end
  def self.search_word(keyword)
    where(["name like? OR introduction like?", "%#{keyword}%","%#{keyword}%"])
  end

end
