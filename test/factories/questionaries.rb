FactoryGirl.define do
  factory :questionary do
    first_name { generate :human_name }
    last_name { generate :human_name }
    email
    patronymic { generate :human_name }
    motto { generate :string }
    ticket { generate :integer }
    mobile_phone { generate :phone }
    birth_date { generate :date }
    home_adress { generate :string }
    avatar { generate :file }
    experience { generate :string }
    want_to_do { generate :string }
    state 'unviewed'
    password { generate :string }
    password_confirmation { password }
  end
end
