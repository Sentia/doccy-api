module Doccy
  class Templates
    
    def self.all(auth_token)
      options = { query: { auth_token: auth_token } }
      
      response = HTTParty.get("#{Doccy::Config.url}/templates.json", options)
    end
    
    
    def self.get(auth_token, template_id)
      options = { query: { auth_token: auth_token } }
      
      response = HTTParty.get("#{Doccy::Config.url}/templates/#{template_id}.json", options)
    end
    
    def self.upload(auth_token, template_params)
      options = { query: { auth_token: auth_token , template: template_params} }
      
      response = HTTParty.post("#{Doccy::Config.url}/templates.json", options)
      
      # puts response.body
    end
    
  end
    
end