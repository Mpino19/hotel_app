class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :room_image
  validate :start_end_check
  validate :start_check
  validates :people, numericality: {only_integer: true, greater_than_or_equal_to: 1}

  def start_end_check
    errors.add("チェックアウトはチェックインより後を選択してください") if self.start_date > self.end_date
  end

  def start_check
    errors.add("チェックイン日に誤りがあります") if self.start_date < Time.now
  end
end
