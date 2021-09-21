class Result < ApplicationRecord
  has_one_attached :document
  validates :name, presence: true, length: {maximum: 50}
  validates :document, presence: true, content_type: { in: %w[application/pdf],
                                      message: "pdfファイルを選択してください。" },
                      size:         { less_than: 5.megabytes,
                                      message: "容量が大きすぎます。" }
end
