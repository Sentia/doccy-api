include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :document do
    converted_document { fixture_file_upload("spec/templates/Word-Template.docx", "application/msword") }
    content        {{"company-name"=>"b", "company-address"=>"c", "name"=>"d", "title"=>"e", "date"=>"f"}}
    template_id     1
    account
    name           "Agreement for Client"
  end


end