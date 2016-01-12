class ArticleForm < ApplicationForm
  property :view, :body, :category_id, :title, :user_id

  validates :title, presence: true
  validates :user_id, presence: true
end
