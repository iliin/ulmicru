class Team < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :member

  include TeamScopes

  state_machine :state, initial: :unviewed do
    state :unviewed
    state :active
    state :removed

    event :confirm do
      transition all => :active
    end
    event :remove do
      transition all => :removed
    end
    event :restore do
      transition all => :unviewed
    end
  end
end
