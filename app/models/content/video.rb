class Content::Video < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates :link, presence: :url

  include Content::VideoScopes

  state_machine :state, initial: :active do
    state :active
    state :unviewed
    state :removed

    event :make_active do
      transition unviewed: :active
    end
    event :hide do
      transition active: :unviewed
    end
    event :remove do
      transition all => :removed
    end
    event :restore do
      transition removed: :unviewed
    end
  end
end
