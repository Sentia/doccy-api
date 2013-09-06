module Doccy
    
  class Accounts
    include HTTParty

    def self.create(company_name, user_name, email, password, options = {})
      receive_newsletter     = options.delete(:receive_newsletter) || true
      
      options = { query: { account: {company_name: company_name, user_name: user_name, email: email, password: password}, auth_token: Doccy::Config.partner_key } }
      response = HTTParty.post("#{Doccy::Config.url}/partners/accounts.json", options)
    end
    
    
  end
    
end