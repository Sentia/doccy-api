FactoryGirl.define do

  factory :account do
    sequence(:name) { |n| "Sentia_#{n}" }
    expires_at 30.days.from_now
    active true
    plan_id ""
    subscription_id ""
    payment_token ""
    api_key ""
    secret ""

    trait :dropbox_authenticated do
      dropbox_oauth_token  "abc123"
      dropbox_oauth_secret "def456"
    end

    trait :subscribed do
      plan
      subscription_id "abc123"
    end

    trait :expired do
      expires_at 31.days.ago
    end

    trait :inactive do
      active false
    end

    trait :with_owner do
      association :owner, factory: :user
    end

    factory :subscribed_account, traits: [:subscribed, :with_owner]
    factory :expired_account,    traits: [:expired, :subscribed]
    factory :inactive_account,   traits: [:inactive, :subscribed]
  end

end