class Member < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true, length: {maximum: 15}
  validates :position, presence: true, length: {maximum: 10}
  validates :from, presence: true, length: {maximum: 20}
  validates :text, presence: true, length: {maximum: 180}
  validates :department, presence: true, length: {maximum: 25}
  validates :director, length: {maximum: 15}
  validates :word, presence: true, length: {maximum: 120}
  validates :addmission_date, presence: true
  validates :image, presence: true, content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "画像ファイルを選択してください。" },
                      size:         { less_than: 5.megabytes,
                                      message: "容量が大きすぎます。" }
                                      
  def display_image
    image.variant(resize_to_limit: [200, 220])
  end
  
  
end
