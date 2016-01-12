class ActivityLines::Corporative::ConfessionForm < ApplicationForm
  property :year, :member_id, :state, :nomination

  collection :arguments do
    property :id
    property :argument_type
    property :text
    property :member_id
    property :confession_id
  end
end
