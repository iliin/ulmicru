class ActivityLineForm < ApplicationForm
  property :title, :found_date, :state, :activity_type, :description, :member_id, required: true
end
