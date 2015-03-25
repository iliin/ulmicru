class EventForm < ActiveForm::Base
  self.main_model = :event

  attributes :title, :description, :main_photo, :creator_id, :begin_date, :end_date,
    :event_type, required: true
end
