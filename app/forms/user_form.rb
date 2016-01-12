class UserForm < ApplicationForm
  property :role, :email, :first_name, :last_name, :patronymic, :password

  validates :role, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
