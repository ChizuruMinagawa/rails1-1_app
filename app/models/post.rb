class Post < ApplicationRecord
  validates :title, length: { maximum: 20 }, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum: 500 }

  validate :date_check #終了日が開始日以降になるよう設定
  def date_check
    return unless start_date && end_date
    if self.start_date > self.end_date
      errors.add(:end_date, "は開始日以降の日付にしてください")
    end
  end
end