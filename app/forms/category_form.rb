class CategoryForm < ApplicationForm
  property :is_last, :parent_id, :name

  validates :name, presence: true
end
