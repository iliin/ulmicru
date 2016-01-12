class QuestionaryForm < ApplicationForm
  property :first_name, :last_name, :patronymic, :email, :motto, :mobile_phone, :birth_date, :home_adress, :municipality, :locality, :avatar, :state, :experience, :want_to_do, required: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :patronymic, presence: true
  validates :email, presence: true
  validates :motto, presence: true
  validates :mobile_phone, presence: true
  validates :birth_date, presence: true
  validates :home_adress, presence: true
  validates :municipality, presence: true
  validates :locality, presence: true
  validates :avatar, presence: true
  validates :state, presence: true
  validates :experience, presence: true
  validates :want_to_do, presence: true
end
