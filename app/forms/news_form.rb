class NewsForm < ApplicationForm 
  self.main_model = :news

  attributes :title, :body, :published_at, :photo, :author_id
end
