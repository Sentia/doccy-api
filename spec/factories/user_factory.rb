FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "dev#{n}@google.com" }
    password "password"
    password_confirmation "password"
    name "Tony Stark"
    account
    majstor false

    trait(:inactive) do
      association :account, factory: :account, active: false
    end

    trait(:admin) do
      majstor true
    end

    trait(:subscribed) do
      association :account, factory: :subscribed_account
    end

    factory :admin,             traits: [:admin]
    factory :subscribed_user,   traits: [:subscribed]
  end

end