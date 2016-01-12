class CommentForm < ApplicationForm
  property :text, :user_id, :parent_id, :record_id, :record_type
end
