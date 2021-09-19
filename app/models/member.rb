class Member < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  validates :position, presence: true, length: {maximum: 10}
  validates :from, presence: true, length: {maximum: 20}
  validates :text, presence: true, length: {maximum: 255}
  validates :department, presence: true, length: {maximum: 25}
  validates :director, length: {maximum: 15}
  validates :word, presence: true, length: {maximum: 155}
  validates :addmission_date, presence: true
end
