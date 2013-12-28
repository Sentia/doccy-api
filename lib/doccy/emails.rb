module Doccy
    
  class Emails
    include HTTParty

    def self.create(auth_token, template_id, document_id, email_params)
      options = { query: { email: email_params, auth_token: auth_token} }
      response = HTTParty.post("#{Doccy::Config.url}/templates/#{template_id}/documents/#{document_id}/emails.json", options)
    end
    
  end
    
end