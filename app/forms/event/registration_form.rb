class Event::RegistrationForm < ApplicationForm
  property :user_id, :event_id, :google_calendar_event_id, :role, require: true
end
