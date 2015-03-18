class Member < User
  belongs_to :parent, class_name: 'Member'
  has_many :attribute_accesses, dependent: :destroy
  has_many :positions, dependent: :destroy

  validates :patronymic, presence: true,
                         human_name: true
  validates :motto, presence: true
  validates :ticket, uniqueness: true
  validates :mobile_phone, presence: true,
                           phone: true
  validates :birth_date, presence: true
  validates :home_adress, presence: true
  validates :municipality, presence: true
  validates :locality, presence: true
  validates :avatar, presence: true

  include MemberScopes
  include Municipalities
  enumerize :municipality, in: Municipalities.list, default: Municipalities.list.first

  state_machine :state, initial: :unviewed do
    state :unviewed
    state :confirmed
    state :declined
    state :removed

    event :confirm do
      transition all => :confirmed
    end
    event :decline do
      transition all => :declined
    end
    event :remove do
      transition all => :removed
    end
    event :restore do
      transition removed: :unviewed
    end
  end
end
