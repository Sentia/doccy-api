require 'api'
require 'spec_helper'

describe Doccy::Accounts do
  
  describe "with valid partner details" do

    it "should create a client account with valid params" do
      
      
      account = Doccy::Accounts.create "company_name", "user_name", "email", "password"
    end
    
    it "should not create an client account with invalid params" do
    
    end
    
  end
  
  describe "with invalid partner details" do
    
    it "should not create an client account" do
      response = mock :code => 403, :body => { error: "invalid_partner_account", 
                                              error_description: "An unknown error has occurred."}
     
    end
    
  end
  
end

