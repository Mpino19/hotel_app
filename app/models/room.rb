class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :room_image

  def self.search_area(area)
    where(["address like?", "%#{area}%"])
  end
  def self.search_word(keyword)
    where(["name like? OR introduction like?", "%#{keyword}%","%#{keyword}%"]) 
  end
end
