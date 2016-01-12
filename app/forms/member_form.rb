class MemberForm < ApplicationForm
  property :first_name, :last_name, :patronymic, :email, :motto, :ticket, :mobile_phone, :birth_date, :home_adress, :municipality, :locality, :avatar, :state, :type, :state_event, :parent_id, :school, :password

  collection :positions do
    property :title
    property :begin_date
    property :member_id
    property :state
    property :end_date
    property :for_now
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :patronymic, presence: true
  validates :email, presence: true
  validates :motto, presence: true
  validates :ticket, presence: true
  validates :mobile_phone, presence: true
  validates :birth_date, :home_adress, presence: true
  validates :municipality, presence: true
  validates :locality, presence: true
  validates :avatar, presence: true
  validates :state, presence: true
  validates :type, presence: true
end
