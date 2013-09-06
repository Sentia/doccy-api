FactoryGirl.define do

  factory :email do
    sequence(:subject) { |n| "Sentia#{n}" }
    message "A cool document"
    recipients "michael.cindric@sentia.com.au"
    pdf false
  end

end
