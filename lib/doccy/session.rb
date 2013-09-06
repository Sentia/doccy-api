module Doccy
    
  class Session
    include HTTParty

    def self.create(email, password)
      options = { query: { email: email, password: password } }
      response = HTTParty.post("#{Doccy::Api::Config.url}/sessions.json", options)
    end
    
  end
    
end