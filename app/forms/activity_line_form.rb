class ActivityLineForm < ApplicationForm
  self.main_model = :activity_line

  attributes :title, :found_date, :state, :activity_type, :description, :member_id, required: true
end
