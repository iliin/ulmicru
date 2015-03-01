class Member < ActiveRecord::Base
  after_save :update_user_name

  belongs_to :parent, class_name: 'Member'
  belongs_to :user
  accepts_nested_attributes_for :user, allow_destroy: true

  validates :patronymic, presence: true,
                         human_name: true
  validates :motto, presence: true
  validates :ticket_number, presence: true,
                            uniqueness: true
  validates :mobile_phone, presence: true,
                           phone: true
  validates :birth_date, presence: true
  validates :home_adress, presence: true
  validates :municipality, presence: true
  validates :locality, presence: true
  validates :avatar, presence: true

  state_machine :state, initial: :not_confirmed do
    state :not_confirmed
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
      transition removed: :not_confirmed
    end
  end

  extend Enumerize
  include Municipalities
  enumerize :municipality, in: Municipalities.list, default: Municipalities.list.first

  mount_uploader :avatar, AvatarUploader

  attr_accessor :first_name, :last_name

  def update_user_name
    User.update(user_id, first_name: first_name, last_name: last_name) if user_id
  end
end
