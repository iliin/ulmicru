class TagForm < ApplicationForm
  property :text, :tag_type, :record_id, :record_type, :target_type, :target_id
end
