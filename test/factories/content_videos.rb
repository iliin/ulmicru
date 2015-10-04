FactoryGirl.define do
  factory :content_video, class: 'Content::Video' do
    title { generate :string }
    description { generate :string }
    link { generate :url }
    author_id { User.last ? User.last.id : create(:user).id }
    state { Content::Video.state_machines[:state].states.map(&:name).first.to_s }
  end
end
