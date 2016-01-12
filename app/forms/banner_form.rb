class BannerForm < ApplicationForm
  property :link, :begin_date, :end_date, :vertical, :horizontal

  validates :link, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
end
