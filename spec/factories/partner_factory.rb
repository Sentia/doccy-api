FactoryGirl.define do

  factory :partner do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:auth_token) { |n| "token#{n}" }
  end

end