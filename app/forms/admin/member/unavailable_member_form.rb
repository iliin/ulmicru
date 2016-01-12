class Admin::Member::UnavailableMemberForm < ActiveForm::Base
  property :first_name, :last_name, :patronymic, :email, :motto, :ticket, :mobile_phone, :birth_date, :home_adress, :municipality, :locality, :avatar, :state, :state_event, :type, :parent_id, :school, :role

  collection :positions do
    property :title
    property :begin_date
    property :end_date
    property :member_id
  end
end
