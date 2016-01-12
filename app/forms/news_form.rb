class NewsForm < ApplicationForm
  property :title, :body, :published_at, :photo, :lead, :user_id

  validates :title, presence: false
  validates :body, presence: false
  validates :published_at, presence: false
  validates :photo, presence: false
  validates :lead, presence: false
  validates :lead, presence: false
end
