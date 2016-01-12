class EventForm < ApplicationForm
  property :title, :description, :main_photo, :place, :creator_id, :begin_date, :end_date, :activity_line_id, :organizer_type, :organizer_id

  collection :registrations do
    property :user_id
    property :event_id
    property :role
  end

  validates :title, presence: true
  validates :description, presence: true
  validates :main_photo, presence: true
  validates :place, presence: true
  validates :creator_id, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
  validates :activity_line_id, presence: true
  validates :organizer_type, presence: true
  validates :organizer_id, presence: true
end
