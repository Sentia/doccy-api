include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :docx_template, class: Template do
    sequence(:name)   { |n| "docx_template#{n}" }
    document_template { fixture_file_upload("spec/templates/Word-Template.docx", "application/msword") }
    account
  end

  factory :pages_template, class: Template do
    sequence(:name)   { |n| "pages_template#{n}" }
    document_template { fixture_file_upload("spec/templates/Pages-Template.pages", "application/octet-stream") }
    account
  end

  factory :blank_template, class: Template do
    sequence(:name)   { |n| "blank_template#{n}" }
    document_template { fixture_file_upload("spec/templates/blank.pages", "application/octet-stream") }
    account
  end


end